import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';
import '../services/WifiAPIService.dart';
import '../model/WifiModel.dart';

class MyWifiController extends GetxController{

  List<WiFiAccessPoint> accessPoints = <WiFiAccessPoint>[];
  StreamSubscription<List<WiFiAccessPoint>>? subscription;
  BuildContext? buildContext;
  bool get isStreaming => subscription != null;
  WifiModel? connectedWifi;
  Timer? timer;
  Timer? checkEnableTimer;
  bool isWifiConnecting = false;
  bool wifiAutoConnect = false;
  bool isWifiDialogDismissed = true;
  bool isLocationDialogDismissed = true;
  var box = GetStorage();
  List<WifiModel> wifiModels = [];
  Location location = Location();
  bool isTimerInitialized = false;


  @override
  void onInit() {
    super.onInit();
    String? jsonData = box.read('wifiStore');
    if(jsonData!=null) {
      List<WifiModel> wms = wifiModelFromJson(jsonData);
      if(wms.isNotEmpty) wifiModels.addAll(wms);
    }
    getAllWifiData();
  }


  initializeMyWifiController(BuildContext context){
    buildContext = context;
    if(!isTimerInitialized){
    checkAllEnable(() async {
        isTimerInitialized = true;
        await startScan();
        startListeningToScanResults();
        await startTimer();
     });
   }
  }

  startTimer() async {
    if (await canGetScannedResults()) {
      timer = Timer.periodic(const Duration(seconds: 15), (Timer t) async {
        await startScan();
        startListeningToScanResults();

        if(accessPoints.isEmpty || (isWifiConnecting && !await WiFiForIoTPlugin.isConnected()) ){
          isWifiConnecting = false;
        }

        if(wifiAutoConnect && !isWifiConnecting ){
          if(! await WiFiForIoTPlugin.isConnected()){
            if(accessPoints.isNotEmpty){
              WifiModel? wm = wifiModels.firstWhereOrNull((element) => element.wifiSsid == accessPoints[0].ssid);
              isWifiConnecting = true;
              connectWifi(wm!);
            }
          }
        }
      });
    }else{
      await startScan();
      startListeningToScanResults();
    }
  }

  @override
  void dispose() {
    super.dispose();
    stopListeningToScanResults();
    timer?.cancel();
    checkEnableTimer?.cancel();
  }

  checkAllEnable(Function whenOkay){
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) async {
      print("checkAllEnable: $isLocationDialogDismissed");

      if(await WiFiForIoTPlugin.isEnabled()){
        print("Wifi is enable");

        isWifiDialogDismissed = true;
       // if (can != CanStartScan.yes ) {
        if (! await location.serviceEnabled() ) {

          print("isLocationDialogDismissed: $isLocationDialogDismissed");
          if (buildContext!.mounted && isLocationDialogDismissed) {
            isLocationDialogDismissed = false;
            await openSettingsDialog(buildContext!, AppSettingsType.location, 'If you want to get auto location access of Neways,You Also Need to Enable Location from settings');
          }
        }else{
          isWifiDialogDismissed = true;
          isLocationDialogDismissed = true;
          checkEnableTimer?.cancel();
          whenOkay();
        }
      }else{
        isLocationDialogDismissed = true;
        if (buildContext!.mounted && isWifiDialogDismissed) {
          isWifiDialogDismissed = false;
          await openSettingsDialog(buildContext!, AppSettingsType.wifi, 'If you want to get auto wifi access of Neways, Need to Enable Wifi from settings');
        }
      }
    });
  }


  startScan() async {
    await WiFiScan.instance.startScan();
  }

  Future<bool> canGetScannedResults() async {
      // check if can-getScannedResults
      final can = await WiFiScan.instance.canGetScannedResults();
      // if can-not, then show error
      if (can != CanGetScannedResults.yes) {
        List<WiFiAccessPoint> tempAccessPoints = <WiFiAccessPoint>[];
        accessPoints.clear();
        for(int i=0; i<tempAccessPoints.length; i++){

          WifiModel? wm = wifiModels.firstWhereOrNull((element) =>  (element.wifiSsid == tempAccessPoints[i].ssid && tempAccessPoints[i].ssid.isNotEmpty));
          if(wm!=null){
            accessPoints.add(tempAccessPoints[i]);
          }
        }
        return false;
      }else{
        startScan();
      }
    return true;
  }

  Future<void> getScannedResults() async {
    if (await canGetScannedResults()) {
      // get scanned results
      List<WiFiAccessPoint> tempAccessPoints = await WiFiScan.instance.getScannedResults();
      accessPoints.clear();
      for(int i=0; i<tempAccessPoints.length; i++){
        WifiModel? wm = wifiModels.firstWhereOrNull((element) =>  (element.wifiSsid == tempAccessPoints[i].ssid && tempAccessPoints[i].ssid.isNotEmpty));
        if(wm!=null){
          accessPoints.add(tempAccessPoints[i]);
        }
      }
    }else{
      await startScan();
      startListeningToScanResults();
    }
  }

  Future<void> startListeningToScanResults() async {
    if (await canGetScannedResults()) {
      subscription = WiFiScan.instance.onScannedResultsAvailable
          .listen((result) async {
        List<WiFiAccessPoint> tempAccessPoints = result;
        accessPoints.clear();
        for(int i=0; i<tempAccessPoints.length; i++){
          WifiModel? wm = wifiModels.firstWhereOrNull((element) =>  (element.wifiSsid == tempAccessPoints[i].ssid && tempAccessPoints[i].ssid.isNotEmpty));
          if(wm!=null){
            accessPoints.add(tempAccessPoints[i]);
          }
        }
        update();
      });
    }
  }

  void stopListeningToScanResults() {
    subscription?.cancel();
    subscription = null;
  }


  connectWifi(WifiModel model) async {
    await WiFiForIoTPlugin.isEnabled().then((val) async {
      await WiFiForIoTPlugin.disconnect();
      await WiFiForIoTPlugin.isConnected().then((val) async {
        await WiFiForIoTPlugin.connect(
          model.wifiSsid.toString(),
          password: model.wifiPassword.toString(),
          joinOnce: false,
          security: NetworkSecurity.WPA,
          isHidden: false,
        ).then((value) {
          if (value) {
            connectedWifi = model;
            getAllWifiData();
          } else {
            isWifiConnecting = false;
          }
        });
      });
    });
    update();
  }


  checkWifiConnection() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }else{
    return false;
  }
}


  /// Show snackbar.
  void kShowSnackBar(BuildContext context, String message) {
    if (kDebugMode) print(message);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }



  Future<void> openSettingsDialog(BuildContext context, AppSettingsType appSettingsType, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Readme'),
          content: Text( message ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
                AppSettings.openAppSettings(type: appSettingsType);
              },
            ),
          ],
        );
      },
    );
  }


  getAllWifiData() async {
    await WifiAPIService.getAllWifiData().then((models) async {
      wifiModels = models;
      update();
      return models;
    });
    update();
    return;
  }
}
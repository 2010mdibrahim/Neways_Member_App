import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/wifi/controller/MyWifiController.dart';
class WifiScannerPage extends StatefulWidget {

  const WifiScannerPage({Key? key}) : super(key: key);

  @override
  State<WifiScannerPage> createState() => _WifiScannerPageState();
}

class _WifiScannerPageState extends State<WifiScannerPage> {

  final MyWifiController myWifiController = Get.put(MyWifiController());

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Available wifi List"),),
      body: GetBuilder<MyWifiController>(
        init: MyWifiController(),
        builder: (controller){
          print("Total Wifi Data: ${controller.wifiModels.length}");
          return Column(children: [
            Row(children: [
              const Text("Auto Connect "),
              Expanded(
                child: Switch(
                  // This bool value toggles the switch.
                  value: controller.wifiAutoConnect,
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      myWifiController.initializeMyWifiController(context);
                      myWifiController.wifiAutoConnect = value;
                      myWifiController.isWifiConnecting = !value;
                    });
                  },
                ),
              ),
            ],),
          ],);
          }
      ),
    );
  }
}

// Expanded(child: ListView.builder(
//   shrinkWrap: true,
//   itemCount: controller.accessPoints.length,
//   itemBuilder: (context, index){
//     WiFiAccessPoint accessPoint = controller.accessPoints[index];
//     return InkWell(
//       onTap: (){
//         WifiModel? wm = controller.wifiModels.firstWhereOrNull((element) => element.wifiSsid == accessPoint.ssid);
//         if(wm==null){
//           showInSnackBar(context, "You have no access");  //10855 //72591
//         }else{
//           controller.connectWifi(wm);
//         }
//       },
//       child: Container(
//         margin: EdgeInsets.all(5),
//         padding: EdgeInsets.all(5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("ssid: ${accessPoint.ssid}"),
//             Text("frequency: ${accessPoint.frequency} MHz"),
//             Text("level: ${accessPoint.level}"),
//             //Text("venueName: ${accessPoint.venueName}"),
//           ],
//         ),
//       ),
//     );
//   },
// )),
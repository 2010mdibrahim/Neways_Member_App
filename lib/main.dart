/*
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mac_address/mac_address.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetMac.macAddress;
    }
    on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('MAC Address : $_platformVersion\n'),
        ),
      ),
    );
  }
}
*/
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/splash/SplashScreen.dart';
import 'package:super_home_member/screens/wifi/pages/WifiScannerPage.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Workmanager().initialize(callbackDispatcher);
  FirebaseMessaging.onBackgroundMessage(_firebasePushHandler);
  // FirebaseMessaging.onMessage;
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'channelKey1',
      channelName: 'channelName1',
      channelDescription: 'channelDescription',
      defaultColor: primaryColor,
      enableLights: true,
      enableVibration: true,
      playSound: true,
    )
  ]);
  await Workmanager().registerOneOffTask(
      "task-identifier-breakfast", "breakfast",
      initialDelay: Duration(
          minutes: timeDuration(duration: 'breakfast', isMinute: true),
          hours: timeDuration(duration: 'breakfast', isHour: true)));

  await Workmanager().registerOneOffTask("task-identifier-lunch", "lunch",
      initialDelay: Duration(
          minutes: timeDuration(duration: 'lunch', isMinute: true),
          hours: timeDuration(duration: 'lunch', isHour: true)));

  await Workmanager().registerOneOffTask("task-identifier-dinner", "dinner",
      initialDelay: Duration(
          minutes: timeDuration(duration: 'dinner', isMinute: true),
          hours: timeDuration(duration: 'dinner', isHour: true)));

  // Workmanager().registerPeriodicTask(
  //   "periodic-task-identifier",
  //   "breakfast",
  //   frequency: const Duration(seconds: 10),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Super Hostel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bodyColor,
        primaryColor: primaryColor,
      ),
      builder: EasyLoading.init(),
      //home: const WifiScannerPage(),
      home: const SplashScreen(),
    );
  }
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    print("Task: $task");
    switch (task) {
      case 'welcome':
        scheduleNotificationTest();
        notify(
            title: "Welcome Back",
            body: "Thank you for choose our super home service.");
        break;
      case 'breakfast':
        notify(
            title: "Good Morning",
            body:
                "Our breakfast service time is start 7:00 am. Breakfast time duration 7:00 am - 10:30 am. Please having you breakfast on time.");
        scheduleNotification(
            title: "Good Morning",
            body:
                "Our breakfast service time is start now. Breakfast time duration 7:00 am - 10:30 am. Please having you breakfast on time.");
        break;
      case 'lunch':
        notify(
            title: "Good Afternoon",
            body:
                "Our lunch service time is start 1:00 pm. Lunch time duration 1:00 pm - 3:30 pm. Please having you lunch on time.");
        scheduleNotification(
            title: "Good Afternoon",
            body:
                "Our lunch service time is start now. Lunch time duration 1:00 pm - 3:30 pm. Please having you lunch on time.");
        break;
      case 'dinner':
        notify(
            title: "Good Night",
            body:
                "Our dinner service time is start 8:00 pm. Dinner time duration 8:00 pm - 10:30 pm. Please having you dinner on time.");
        scheduleNotification(
            title: "Good Night",
            body:
                "Our dinner service time is start now. Dinner time duration 8:00 pm - 10:30 pm. Please having you dinner on time.");
        break;
      default:
    }
    return Future.value(true);
  });
}

Future<void> _firebasePushHandler(RemoteMessage message) async {
  print("Message from push notification is ${message.data}");
  // AwesomeNotifications().createNotificationFromJsonData(message.data);
  Box box = await openBox('notifications');
  box.add(message.data);
  // AwesomeNotifications().actionStream.listen((event) {
  //   Get.to(NotificationDetailsScreen(
  //       notification: NotificationCustomeModel.fromJson(message.data)));
  // });
}

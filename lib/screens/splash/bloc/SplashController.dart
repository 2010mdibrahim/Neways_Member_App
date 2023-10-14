// ignore_for_file: unused_field, file_names, avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/get_started/GetStartedScreen.dart';
import 'package:super_home_member/screens/home/HomeScreen.dart';
import 'package:super_home_member/screens/onBroding/intro_screen.dart';
import 'package:super_home_member/screens/splash/services/popup_ads_service.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  late Timer _timer;

  int _time = 2;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_time == 0) {
          timer.cancel();
          if (box.read('login') == true) {
            Get.offAll(HomeScreen(), transition: Transition.rightToLeft);
          } else {
            if (box.read('firstInstall') == null) {
              Get.offAll(IntroScreen(), transition: Transition.rightToLeft);
            } else {
              // Get.offAll(IntroScreen(), transition: Transition.rightToLeft);
              Get.offAll(const GetStartedScreen(),
                  transition: Transition.rightToLeft);
            }
          }
        } else {
          _time--;
        }
      },
    );
    update();
  }

  @override
  void onInit() {
    super.onInit();
    FirebaseMessaging.instance.getToken().then((value) {
      box.write('device_token', value);
      print('Token: ' + value!);
    });
    firebaseCloudMessagingListeners();
    getPopUpAds();
    startTimer();
  }

  firebaseCloudMessagingListeners() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      var notificationMessage = json.decode(message.data['message']);
      if (notification != null && android != null) {
        await AwesomeNotifications().createNotification(
          content: notificationMessage['image'] == null
              ? NotificationContent(
                  id: int.parse(notificationMessage['id']),
                  channelKey: 'channelKey1',
                  title: notification.title,
                  body: notification.body)
              : NotificationContent(
                  id: int.parse(notificationMessage['id']),
                  channelKey: 'channelKey1',
                  title: notification.title,
                  body: notification.body,
                  bigPicture: notificationMessage['image'],
                  notificationLayout: NotificationLayout.BigPicture),
        );
        Box box = await openBox('notifications');
        box.add(message.data);
        // AwesomeNotifications().actionStream.listen((event) {
        //   Get.to(NotificationDetailsScreen(
        //       notification: NotificationCustomeModel.fromJson(message.data)));
        // });
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      var notificationMessage = json.decode(message.data['message']);
      if (notification != null && android != null) {
        await AwesomeNotifications().createNotification(
          content: notificationMessage['image'] == null
              ? NotificationContent(
                  id: int.parse(notificationMessage['id']),
                  channelKey: 'channelKey1',
                  title: notification.title,
                  body: notification.body)
              : NotificationContent(
                  id: int.parse(notificationMessage['id']),
                  channelKey: 'channelKey1',
                  title: notification.title,
                  body: notification.body,
                  bigPicture: notificationMessage['image'],
                  notificationLayout: NotificationLayout.BigPicture),
        );
        Box box = await openBox('notifications');
        box.add(message.data);
        // AwesomeNotifications().actionStream.listen((event) {
        //   Get.to(NotificationDetailsScreen(
        //       notification: NotificationCustomeModel.fromJson(message.data)));
        // });
      }
    });
  }

  getPopUpAds() async {
    try {
      await PopupAdsAPIService.getData().then((value) {
        print((value));
        if ((value).isEmpty) {
          box.write('popup', false);
        } else {
          if (box.read('popup_img') == value['image'] && value['show'] == 0) {
            box.write('popup', false);
          } else {
            box.write('popup', true);
            box.write('popup_img', value['image']);
            box.write('popup_link', value['link']);
            box.write('show_popup', value['show']);
          }
        }
      });
    } catch (e) {
      box.write('popup', false);
      print(e);
    }

    update();
  }
}

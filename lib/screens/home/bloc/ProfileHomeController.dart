// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/home/HomeScreen.dart';
import 'package:super_home_member/screens/home/services/available_remaing_days_api.service.dart';
import 'package:super_home_member/screens/home/services/shpoint_api_service.dart';
import 'package:super_home_member/screens/login/LoginScreen.dart';
import 'package:super_home_member/screens/login/models/login_respones.dart';

class ProfileHomeController extends GetxController {
  final box = GetStorage();
  late LoginResponse member;
  int availableDays = 0;
  double shPoint = 0;
  String availableDaysTitle = "Days Remaining";
  Color availableDaysColor = Colors.white;
  late bool isLogin;
  bool isShowPoint = false;
  @override
  void onInit() async {
    super.onInit();
    getUser();
    await availableRemaingDays();
    await getShPoint();
  }

  getUser() {
    if (box.read('login') == true) {
      member = LoginResponse(
        token: box.read('token'),
        user: User(
          bookingId: box.read('bookingId'),
          cardNumber: box.read('cardNumber'),
          id: box.read('id'),
          name: box.read('name'),
          packageName: box.read('packageName'),
          avater: box.read('avater'),
        ),
      );
      isLogin = true;
    } else {
      isLogin = false;
      Get.to(const LoginScreen());
    }
    update();
  }

  availableRemaingDays() async {
    try {
      await AvailableRemaingDaysAPIService.getData().then((value) {
        if (int.parse(value.availableDays.toString()) < 0) {
          print(value.tryUs.runtimeType);
          if (value.tryUs == 0) {
            availableDays = 10 - DateTime.now().day;
            availableDaysTitle = "Payment Duration";
            if (availableDays < 0) {
              availableDays = DateTime.now().day - 10;
              availableDaysTitle = "Days Over";
            }
          } else {
            availableDays =
                int.parse(value.availableDays.toString().replaceAll('-', ''));
            availableDaysTitle = "Days Over";
          }
          // availableDaysColor = Colors.red.shade300;
        } else {
          availableDays = int.parse(value.availableDays.toString());
          availableDaysTitle = "Days Remaining";
        }
        box.write('availableDays', availableDays);
        box.write('availableDaysTitle', availableDaysTitle);
      });
    } catch (e) {
      availableDays = box.read('availableDays');
      availableDaysTitle = box.read('availableDaysTitle');
    }

    update();
  }

  getShPoint() async {
    try {
      await SHPointAPIService.getData().then((value) {
        shPoint = value.balance.toDouble();
        box.write('shPoint', value.balance.toString());
      });
    }
    catch (e) {
      shPoint = box.read('shPoint') ;
    }
    update();

  }

  onPressSHPointButton() {
    isShowPoint = !isShowPoint;
    getShPoint();
    update();
  }

  logout() {
    box.write('login', false);
    box.write('token', null);
    isLogin = false;
    Get.snackbar(
      'Success',
      "Account logout successfully",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(8),
      backgroundColor: Colors.black,
    );
    Get.offAll(HomeScreen());
    update();
  }

}


/// old
/*
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/home/HomeScreen.dart';
import 'package:super_home_member/screens/home/services/available_remaing_days_api.service.dart';
import 'package:super_home_member/screens/home/services/shpoint_api_service.dart';
import 'package:super_home_member/screens/login/LoginScreen.dart';
import 'package:super_home_member/screens/login/models/login_respones.dart';

class ProfileHomeController extends GetxController {
  final box = GetStorage();
  late LoginResponse member;
  int availableDays = 0;
  double shPoint = 0;
  String availableDaysTitle = "Days Remaining";
  Color availableDaysColor = Colors.white;
  late bool isLogin;
  bool isShowPoint = false;
  @override
  void onInit() async {
    super.onInit();
    getUser();
    await availableRemaingDays();
    await getShPoint();
  }

  getUser() {
    if (box.read('login') == true) {
      member = LoginResponse(
        token: box.read('token'),
        user: User(
          bookingId: box.read('bookingId'),
          cardNumber: box.read('cardNumber'),
          id: box.read('id'),
          name: box.read('name'),
          packageName: box.read('packageName'),
          avater: box.read('avater'),
        ),
      );
      isLogin = true;
    } else {
      isLogin = false;
      Get.to(const LoginScreen());
    }
    update();
  }

  availableRemaingDays() async {
    try {
      await AvailableRemaingDaysAPIService.getData().then((value) {
        if (int.parse(value.availableDays.toString()) < 0) {
          print(value.tryUs.runtimeType);
          if (value.tryUs == 0) {
            availableDays = 10 - DateTime.now().day;
            availableDaysTitle = "Payment Duration";
            if (availableDays < 0) {
              availableDays = DateTime.now().day - 10;
              availableDaysTitle = "Days Over";
            }
          } else {
            availableDays =
                int.parse(value.availableDays.toString().replaceAll('-', ''));
            availableDaysTitle = "Days Over";
          }

          // availableDaysColor = Colors.red.shade300;
        } else {
          availableDays = int.parse(value.availableDays.toString());
          availableDaysTitle = "Days Remaining";
        }
        box.write('availableDays', availableDays);
        box.write('availableDaysTitle', availableDaysTitle);
      });
    } catch (e) {
      availableDays = box.read('availableDays');
      availableDaysTitle = box.read('availableDaysTitle');
    }

    update();
  }

  getShPoint() async {
    try {
      await SHPointAPIService.getData().then((value) {
        shPoint = value.balance.toDouble();
        box.write('shPoint', value.balance.toString());
      });
    } catch (e) {
      shPoint = box.read('shPoint') ;
    }
    update();
  }

  onPressSHPointButton() {
    isShowPoint = !isShowPoint;
    getShPoint();
    update();
  }

  logout() {
    box.write('login', false);
    box.write('token', null);
    isLogin = false;
    Get.snackbar(
      'Success',
      "Account logout successfully",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(8),
      backgroundColor: Colors.black,
    );
    Get.offAll(HomeScreen());
    update();
  }

}

 */
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/request/food_request/models/food_request.dart';
import 'package:super_home_member/screens/request/food_request/services/food_request_api_service.dart';

class FoodRequestController extends GetxController {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  TextEditingController note = TextEditingController();
  final box = GetStorage();
  List<FoodRequest> foodRequesteds = [];
  bool isLoading = false;
  bool isBreakfast = false;
  bool isLunch = false;
  bool isDinner = false;

  @override
  void onInit() {
    super.onInit();
    getFoodRequest();
  }

  getFoodRequest() async {
    isLoading = true;
    await EasyLoading.show();
    await FoodRequestAPIService.getRequestedFood().then((value) {
      if (value.runtimeType == List<FoodRequest>) {
        foodRequesteds = value;
      } else {}
    });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }

  delete(id) async {
    EasyLoading.dismiss();
    return true;
  }

  submit() async {
    if (!isBreakfast && !isDinner && !isLunch) {
      Get.snackbar(
        'Wrong',
        "Meal type must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    if (isBreakfast) {
      await FoodRequestAPIService.submit(
          data: FoodRequest(
        cardNumber: box.read('cardNumber'),
        mealType: "Breakfast",
        note: note.text,
        date: "${date.day}/${date.month}/${date.year}",
        time:
            "${time.hour}:${time.minute} ${time.period.toString().split("DayPeriod.")[1]}",
      ));
    }
    if (isLunch) {
      await FoodRequestAPIService.submit(
          data: FoodRequest(
        cardNumber: box.read('cardNumber'),
        mealType: "Lunch",
        note: note.text,
        date: "${date.day}/${date.month}/${date.year}",
        time:
            "${time.hour}:${time.minute} ${time.period.toString().split("DayPeriod.")[1]}",
      ));
    }
    if (isDinner) {
      await FoodRequestAPIService.submit(
          data: FoodRequest(
        cardNumber: box.read('cardNumber'),
        mealType: "Dinner",
        note: note.text,
        date: "${date.day}/${date.month}/${date.year}",
        time:
            "${time.hour}:${time.minute} ${time.period.toString().split("DayPeriod.")[1]}",
      ));
    }

    await getFoodRequest();

    EasyLoading.dismiss();
    return true;
  }

  checkBreakfast(value) {
    if (10 > time.hour &&
        time.period.toString().split("DayPeriod.")[1] == "am") {
      isBreakfast = value;
    } else {
      // Get.snackbar(
      //   'Sorry',
      //   "Breakfast request time almost over!",
      //   snackPosition: SnackPosition.BOTTOM,
      //   colorText: Colors.white,
      //   margin: const EdgeInsets.all(8),
      //   backgroundColor: Colors.black,
      // );
    }
    isBreakfast = value;
    update();
  }

  checkLunch(value) {
    if (3 > time.hour &&
        time.period.toString().split("DayPeriod.")[1] == "pm") {
      isLunch = value;
    } else {
      // Get.snackbar(
      //   'Sorry',
      //   "Lunch request time almost over!",
      //   snackPosition: SnackPosition.BOTTOM,
      //   colorText: Colors.white,
      //   margin: const EdgeInsets.all(8),
      //   backgroundColor: Colors.black,
      // );
    }
    isLunch = value;
    update();
  }

  checkDinner(value) {
    if ((10 > time.hour &&
            time.period.toString().split("DayPeriod.")[1] == "pm") ||
        (00 < time.hour &&
            time.period.toString().split("DayPeriod.")[1] == "am")) {
      isDinner = value;
    } else {
      // Get.snackbar(
      //   'Sorry',
      //   "Dinner request time almost over!",
      //   snackPosition: SnackPosition.BOTTOM,
      //   colorText: Colors.white,
      //   margin: const EdgeInsets.all(8),
      //   backgroundColor: Colors.black,
      // );
    }
    isDinner = value;
    update();
  }
}

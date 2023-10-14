// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/auth/bloc/AuthController.dart';
import 'package:super_home_member/screens/booking_info/models/booking_response.dart';
import 'package:super_home_member/screens/booking_info/services/booking_api_service.dart';

class BookingInfoController extends GetxController {
  late BookingResponse booking = BookingResponse(id: 0);
  final AuthController _authController = AuthController();
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    await getBooking();
  }

  getBooking() async {
    isLoading = true;
    await EasyLoading.show();
    var data = await BookingAPIService.getData();
    if (data.runtimeType == BookingResponse) {
      isLoading = false;
      booking = data;
    } else {
      if (data != null) {
        Get.snackbar(
          'Error',
          data['error'],
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.black,
        );
      }
      else {
        Get.snackbar(
          'Error',
          "Server Error! Please Try Again",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.black,
        );
      }
      isLoading = false;
      _authController.logout();
    }
    EasyLoading.dismiss();
    update();
  }
}

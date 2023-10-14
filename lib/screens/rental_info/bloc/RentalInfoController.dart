// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/auth/bloc/AuthController.dart';
import 'package:super_home_member/screens/rental_info/models/rentalInfo_details_response.dart';
import 'package:super_home_member/screens/rental_info/services/rental_info_api_service.dart';

import '../models/rentalInfo_response.dart';

class RentalInfoController extends GetxController {
  late List<RentalInfoResponse> rentalInfoResponses = [];
  final AuthController _authController = AuthController();
  late RentalInfoDetailsResponse rentalInfo;
  bool isLoading = false;
  late int rentalId;

  @override
  void onInit() async {
    super.onInit();
    await getRentalInformations();
  }


  Future getRentalInformations() async {
    isLoading = true;
    await EasyLoading.show();
    var data = await RentalInfoAPIService.getAllData();
    if (data.runtimeType.toString() == 'List<RentalInfoResponse>') {
      isLoading = false;
      for (var element in data) {
        rentalInfoResponses.add(RentalInfoResponse(
            id: element.id,
            date: element.date,
            packageName: element.packageName,
            rechargeDays: element.rechargeDays,
            rentStatus: element.rentStatus,
            totalAmount: element.totalAmount));
      }
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
      } else {
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

  setId(value) {
    rentalId = value;
    getDetails();
    update();
  }

  getDetails() async {
    isLoading = true;
    rentalInfo = await RentalInfoAPIService.getData(id: rentalId).then((value) {
      isLoading = false;
      return value;
    });

    update();
  }
}

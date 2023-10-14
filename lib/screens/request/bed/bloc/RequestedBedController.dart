// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/request/bed/models/requested_bed_response.dart';
import 'package:super_home_member/screens/request/bed/services/bed_api_service.dart';

class RequestedBedController extends GetxController {
  List<RequestedBedResponce> beds = [];
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    getBeds();
  }

  getBeds() async {
    isLoading = true;
    await EasyLoading.show();
    await BedAPIService.getRequestedBed().then((value) {
      if (value.runtimeType == List<RequestedBedResponce>) {
        beds = value;
      } else {}
    });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }

  delete(id) async {
    await EasyLoading.show();
    await BedAPIService.delete(id: id);
    await EasyLoading.dismiss();
    Get.snackbar(
      'Success',
      "Bed Change Request Delete Successfull",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(8),
      backgroundColor: Colors.black,
    );
    await getBeds();
    update();
    return true;
  }
}

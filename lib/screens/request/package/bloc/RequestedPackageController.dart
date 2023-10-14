// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/request/package/models/requested_package_response.dart';
import 'package:super_home_member/screens/request/package/services/package_api_service.dart';

class RequestedPackageController extends GetxController {
  List<RequestedPackageResponce> packages = [];
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    getPackages();
  }

  getPackages() async {
    isLoading = true;
    await EasyLoading.show();
    await PackageAPIService.getRequestedPackage().then((value) {
      if (value.runtimeType == List<RequestedPackageResponce>) {
        packages = value;
      } else {}
    });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }

  delete(id) async {
    await EasyLoading.show();
    await PackageAPIService.delete(id: id);
    await EasyLoading.dismiss();
    Get.snackbar(
      'Success',
      "Package Delete Successfull",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(8),
      backgroundColor: Colors.black,
    );
    await getPackages();
    update();
    return true;
  }
}

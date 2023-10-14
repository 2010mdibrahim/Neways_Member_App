// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/chat_with_us/chat_complain/chat_models/complain_response.dart';
import 'package:super_home_member/screens/chat_with_us/chat_complain/chat_services/complain_api_service.dart';

class ComplainListController extends GetxController {
  List<ComplainResponce> complains = [];
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    getComplains();
  }

  getComplains() async {
    isLoading = true;
    await EasyLoading.show();
    await ComplainAPIService.getAllComplain().then((value) {
      if (value.runtimeType == List<ComplainResponce>) {
        complains = value;
      } else {}
    });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }

  delete(id) async {
    await EasyLoading.show();
    await ComplainAPIService.delete(id: id);
    await EasyLoading.dismiss();
    Get.snackbar(
      'Success',
      "Complain Delete Successfull",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(8),
      backgroundColor: Colors.black,
    );
    await getComplains();
    update();
    return true;
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/request/branch/models/requested_branch_response.dart';

import '../services/branch_api_service.dart';

class RequestedBranchController extends GetxController {
  List<RequestedBranchResponce> branches = [];
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    getBranch();
  }

  getBranch() async {
    isLoading = true;
    await EasyLoading.show();
    await BranchAPIService.getRequestedBranch().then((value) {
      if (value.runtimeType == List<RequestedBranchResponce>) {
        branches = value;
      } else {}
    });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }

  delete(id) async {
    await EasyLoading.show();
    await BranchAPIService.delete(id: id);
    await getBranch();
    // await EasyLoading.dismiss();
    Get.snackbar(
      'Success',
      "Branch Change Request Delete Successfull",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(8),
      backgroundColor: Colors.black,
    );
    update();
    return true;
  }
}

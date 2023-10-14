// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../models/branch_request.dart';
import '../models/branch_responce.dart';
import '../services/branch_api_service.dart';

class BranchChangeController extends GetxController {
  List<BranchResponse> branches = [];
  late BranchResponse currentBranche;
  DateTime date = DateTime.now();
  TextEditingController note = TextEditingController();
  bool isLoading = false;
  String selectedBranch = 'Select Branch';
  @override
  void onInit() {
    super.onInit();
    getBranch();
  }

  getBranch() async {
    isLoading = true;
    await EasyLoading.show();
    await BranchAPIService.getCurrentBranch().then((value) {
      if (value.runtimeType == BranchResponse) {
        currentBranche = value;
      } else {}
    });
    await BranchAPIService.getAllData().then((value) {
      if (value.runtimeType == List<BranchResponse>) {
        branches = value;
        branches.removeAt(0);
        branches.add(BranchResponse(name: 'Select Branch'));
      } else {}
    });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }

  selectBranch(value) {
    selectedBranch = value;
    update();
  }

  submit() async {
    if (selectedBranch == "Select Branch") {
      Get.snackbar(
        'Wrong',
        "Requested branch field must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    await BranchAPIService.submit(
        data: BranchRequest(
      currentBranch: currentBranche.name,
      requestBranch: selectedBranch,
      note: note.text,
      status: false,
      date: "${date.day}/${date.month}/${date.year}",
    ));

    EasyLoading.dismiss();
    return true;
  }

  Future pickDate(BuildContext context, {DateTime? initialDate}) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      // firstDate: DateTime.now().subtract(const Duration(days: 0)),
      firstDate: DateTime(DateTime.now().year - (DateTime.now().year - 2000)),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (newDate == null) return;
    // return '${date.day}/${date.month}/${date.year}';
    date = newDate;
    update();
    return newDate;
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/request/branch/models/branch_responce.dart';

import '../models/bed_change_request.dart';
import '../models/changeable_bed_response.dart';
import '../models/current_bed_response.dart';
import '../services/bed_api_service.dart';

class BedChangeController extends GetxController {
  List<BranchResponse> branches = [];
  late CurrentBedResponse currentBed;
  late ChangeableBedResponse changeableBed = ChangeableBedResponse();
  DateTime date = DateTime.now();
  TextEditingController note = TextEditingController();
  bool isLoading = false;
  bool isSelectBed = false;
  String selectedBranch = 'Select Bed';
  @override
  void onInit() {
    super.onInit();
    getBranch();
  }

  getBranch() async {
    isLoading = true;
    await EasyLoading.show();
    await BedAPIService.getCurrentBed().then((value) {
      if (value.runtimeType == CurrentBedResponse) {
        currentBed = value;
      } else {}
    });
    // await BranchAPIService.getAllData().then((value) {
    //   print(value.runtimeType == List<BranchResponse>);
    //   if (value.runtimeType == List<BranchResponse>) {
    //     branches = value;
    //     branches.removeAt(0);
    //     branches.add(BranchResponse(name: 'Select Branch'));
    //   } else {}
    // });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }

  selectBranch(value) {
    selectedBranch = value;
    update();
  }

  submit() async {
    if (!isSelectBed) {
      Get.snackbar(
        'Wrong',
        "Requested bed field must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    await BedAPIService.submit(
        data: BedChangeRequest(
      currentBed: currentBed.bedName,
      requestBed: changeableBed.bedName,
      requestBedId: changeableBed.id,
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

  setRequetedBed(ChangeableBedResponse bed) {
    changeableBed = bed;
    isSelectBed = true;
    update();
  }
}

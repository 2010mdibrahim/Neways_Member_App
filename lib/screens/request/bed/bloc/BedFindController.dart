// ignore_for_file: file_names

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../models/changeable_bed_response.dart';
import '../services/bed_api_service.dart';

class BedFindController extends GetxController {
  List<ChangeableBedResponse> beds = [];
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    getChangeAbleBed();
  }

  getChangeAbleBed() async {
    isLoading = true;
    await EasyLoading.show();

    await BedAPIService.getAllData().then((value) {
      if (value.runtimeType == List<ChangeableBedResponse>) {
        beds = value;
      } else {}
    });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }
}

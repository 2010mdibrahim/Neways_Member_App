// ignore_for_file: file_names

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../models/bed_change_response.dart';
import '../services/bed_change_api_service.dart';

class BedChangeController extends GetxController {
  List<BedChangeResponse> beds = <BedChangeResponse>[];
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    await getAllData();
  }

  Future getAllData() async {
    isLoading = true;
    await EasyLoading.show();
    beds = await BedChangeAPIService.getAllData().then((value) {
      isLoading = false;
      return value;
    });
    EasyLoading.dismiss();
    update();
  }
}

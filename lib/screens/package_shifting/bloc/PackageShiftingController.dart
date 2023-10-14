// ignore_for_file: file_names

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/package_shifting/models/package_shifting_response.dart';
import 'package:super_home_member/screens/package_shifting/services/package_shifting_api_service.dart';

class PackageShiftingController extends GetxController {
  List<PackageShiftingResponse> packages = <PackageShiftingResponse>[];
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    await getAllPackages();
  }

  getAllPackages() async {
    isLoading = true;
    await EasyLoading.show();
    packages = await PackageShiftingAPIService.getAllData().then((value) {
      isLoading = false;
      return value;
    });
    EasyLoading.dismiss();
    update();
  }
}

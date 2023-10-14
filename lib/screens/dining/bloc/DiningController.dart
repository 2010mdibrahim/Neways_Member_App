// ignore_for_file: file_names

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/dining/services/dining_api_service.dart';
import '../models/dining_response.dart';

class DiningController extends GetxController {
  List<DiningResponse> dinings = <DiningResponse>[];
  bool isLoading = false;
  @override
  onInit() async {
    super.onInit();
    await getAllDiningsData();
  }

  getAllDiningsData() async {
    isLoading = true;
    await EasyLoading.show();
    dinings = await DiningAPIService.getAllData().then((value) {
      isLoading = false;
      return value;
    });
    EasyLoading.dismiss();
    update();
  }
}

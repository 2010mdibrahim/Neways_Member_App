// ignore_for_file: file_names

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/transactions/models/transction_response.dart';
import 'package:super_home_member/screens/transactions/services/transction_api_service.dart';

class TransctionController extends GetxController {
  List<TransctionResponse> transctions = <TransctionResponse>[];
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    await getAllTransctions();
  }

  getAllTransctions() async {
    isLoading = true;
    await EasyLoading.show();
    transctions = await TransactionAPIService.getAllData().then((value) {
      isLoading = false;
      return value;
    });
    await EasyLoading.dismiss();
    update();
  }
}

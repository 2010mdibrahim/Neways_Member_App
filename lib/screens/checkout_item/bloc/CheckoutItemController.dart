// ignore_for_file: file_names, avoid_print

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../models/checkout_item_response.dart';
import '../services/checkout_api_services.dart';

class CheckoutItemController extends GetxController {
  late List<CheckoutItemResponse> items;
  bool isLoading = false;

  @override
  void onInit() async {
    super.onInit();
    await getAllCheckoutItems();
  }

  getAllCheckoutItems() async {
    isLoading = true;
    await EasyLoading.show();
    items = await CheckoutAPIService.getData().then((value) {
      isLoading = false;
      return value;
    });
    EasyLoading.dismiss();
    update();
  }
}

// ignore_for_file: file_names

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/purchase_item/services/PurchaseItemAPIService.dart';
import '../models/purchase_item_response.dart';

class PurchaseItemController extends GetxController {
  List<PurchaseItemResponse> items = <PurchaseItemResponse>[];
  late PurchaseItemResponse purchaseItem;
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    await getAllItems();
  }

  getAllItems() async {
    isLoading = true;
    await EasyLoading.show();
    items = await PurchaseItemAPIService.getAllData().then((value) {
      isLoading = false;
      return value;
    });
    EasyLoading.dismiss();
    update();
  }

  setPurchaseItem(PurchaseItemResponse value) {
    purchaseItem = value;
    update();
  }
}

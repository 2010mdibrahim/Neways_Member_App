// ignore_for_file: file_names, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_category_response_model.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_details_response_model.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_response_model.dart';
import 'package:super_home_member/screens/buy_sell/services/buy_sell_services.dart';
import 'package:url_launcher/url_launcher.dart';

class BuySellController extends GetxController {
  List<BuySellCategoryResponseModel> categories = [];
  List<BuySellResponseModel> buysells = [];
  late BuySellCategoryResponseModel category;
  late BuySellResponseModel buysell;
  late BuySellDetailsResponseModel product;
  late TextEditingController search = TextEditingController(text: '');
  bool isLoading = false;
  bool autofocus = false;
  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  getAllCategories() async {
    isLoading = true;
    await EasyLoading.show();
    categories = await BuySellAPIService.getAllCategory().then((value) {
      isLoading = false;
      return value;
    });
    EasyLoading.dismiss();
    update();
  }

  setCategory({value}) {
    if (value != null) {
      category = value;
      autofocus = false;
    } else {
      category = BuySellCategoryResponseModel(
        categoryName: 'All Category',
        id: 0,
      );
      autofocus = true;
    }
    getAllBuySellProducts();
    update();
  }

  getAllBuySellProducts({searchStr = ''}) async {
    isLoading = true;
    await EasyLoading.show();
    try {
      await BuySellAPIService.getAllProduct(
              categoryId: category.id.toString(),
              search: searchStr,
              size: 10000)
          .then((value) {
        buysells = value;
        isLoading = false;
        return value;
      });
    } catch (e) {
      print(e);
    }

    EasyLoading.dismiss();
    update();
  }

  setBuySell(value) {
    buysell = value;
    getBuySellProduct();
    update();
  }

  getBuySellProduct() async {
    isLoading = true;
    await EasyLoading.show();
    try {
      await BuySellAPIService.getProduct(slug: buysell.slug.toString())
          .then((value) {
        product = value;
        isLoading = false;
        return value;
      });
    } catch (e) {
      print(e);
    }

    EasyLoading.dismiss();
    update();
  }

  Future<void> makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: product.phoneNumber,
    );
    await launchUrl(launchUri);
  }
}

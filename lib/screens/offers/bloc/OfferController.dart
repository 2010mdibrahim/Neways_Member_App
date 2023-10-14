// ignore_for_file: file_names

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/offers/models/offers_response_model.dart';
import 'package:super_home_member/screens/offers/services/offers_api_service.dart';

class OfferController extends GetxController {
  List<OfferResponseModel> offers = [];
  @override
  void onInit() async {
    super.onInit();
    await getAllOffers();
  }

  getAllOffers() async {
    EasyLoading.show();
    offers = await OfferAPIService.getAllOffer();
    EasyLoading.dismiss();
    update();
  }
}

// ignore_for_file: file_names, avoid_print

import 'package:get/get.dart';
import 'package:super_home_member/screens/home/models/offer_slider.dart';
import 'package:super_home_member/screens/home/services/slider_api_service.dart';

class OfferSliderController extends GetxController {
  List<OfferSlider> sliders = [];
  @override
  void onInit() {
    super.onInit();
    getSliders();
  }

  getSliders() async {
    try {
      await SliderAPIService.getAllData().then((value) async {
        if (value.runtimeType == List<OfferSlider>) {
          sliders = value;
        } else {
          await getSliders();
        }
      });
    } catch (e) {
      print("Offer Slider: $e");
    }

    update();
  }
}

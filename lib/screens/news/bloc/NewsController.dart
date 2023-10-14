// ignore_for_file: avoid_print, file_names

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/home/models/latest_news_response.dart';
import 'package:super_home_member/screens/home/services/news_api_service.dart';

class NewsController extends GetxController {
  List<LatestNewsResponse> news = [];
  late int limit = 50;
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    // Future.delayed(const Duration(milliseconds: 500));
    getNews(size: limit);
  }

  getNews({size}) async {
    isLoading = true;
    EasyLoading.show();
    try {
      await NewsAPIService.getAllNews(size: limit).then((value) async {
        if (value.runtimeType == List<LatestNewsResponse>) {
          news = value;
        } else {
          print("Server Error :  News");
          await getNews(size: limit);
        }

        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
    EasyLoading.dismiss();
    update();
  }
}

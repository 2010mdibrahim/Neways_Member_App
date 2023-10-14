// ignore_for_file: file_names, avoid_print

import 'package:get/get.dart';
import 'package:super_home_member/screens/home/models/latest_news_response.dart';
import 'package:super_home_member/screens/home/services/news_api_service.dart';

class LatestNewsController extends GetxController {
  List<LatestNewsResponse> news = [];
  late int limit = 5;
  @override
  void onInit() {
    super.onInit();
    // Future.delayed(const Duration(milliseconds: 500));
    getNews(size: limit);
  }

  getNews({size}) async {
    try {
      print("Call Latest news");
      await NewsAPIService.getAllData(size: limit).then((value) async {
        if (value.runtimeType == List<LatestNewsResponse>) {
          news = value;
        } else {
          print("Server Error : Latest News");
          await getNews(size: limit);
        }
      });
    } catch (e) {
      print(e);
    }

    update();
  }
}

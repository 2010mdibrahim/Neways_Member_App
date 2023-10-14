// ignore_for_file: file_names, avoid_print

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:super_home_member/screens/home/models/latest_news_response.dart';
import 'package:super_home_member/screens/home/services/news_api_service.dart';

class LatestNewsDetailsController extends GetxController {
  LatestNewsResponse news = LatestNewsResponse();
  bool isLoadding = false;
  getNews({slug}) async {
    isLoadding = true;
    await EasyLoading.show();
    try {
      await NewsAPIService.getData(slug: slug).then((value) {
        if (value.runtimeType == LatestNewsResponse) {
          news = value;
        } else {}
      });
    } catch (e) {
      print(e);
    }
    isLoadding = false;

    await EasyLoading.dismiss();

    update();
  }
}

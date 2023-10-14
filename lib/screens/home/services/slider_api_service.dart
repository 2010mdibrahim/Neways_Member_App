// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/home/models/offer_slider.dart';
import 'package:super_home_member/services/httpClient.dart';

class SliderAPIService {
  static getAllData() async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.baseUrl =
        'http://116.68.198.178/super_home_member_mobile_application/v1/api/';
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    print(_http.options.headers);
    try {
      Response response = await _http.get(
        '/offer-sliders?size=10',
      );
      if (response.statusCode == 200) {
        return offerSliderFromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error: Private API URL"};
      }
      if (e.response?.statusCode == 403) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }
}

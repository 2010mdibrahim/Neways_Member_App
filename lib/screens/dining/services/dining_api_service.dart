// ignore_for_file: avoid_print, file_names

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/dining/models/dining_response.dart';
import 'package:super_home_member/services/httpClient.dart';

class DiningAPIService {
  static getAllData() async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };

    try {
      Response response = await _http.post('/dinings', data: {"size": 100});
      if (response.statusCode == 200) {
        return diningResponseFromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }
}

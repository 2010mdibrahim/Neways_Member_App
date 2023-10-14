// ignore_for_file: avoid_print, file_names

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/services/httpClient.dart';

import '../models/bed_change_response.dart';

class BedChangeAPIService {
  static getAllData() async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };

    try {
      Response response = await _http.post(
        '/bed_changes',
      );
      if (response.statusCode == 200) {
        return bedChangeResponseFromJson(response.data['data']);
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

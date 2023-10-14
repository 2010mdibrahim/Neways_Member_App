// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/request/food_request/models/food_request.dart';
import 'package:super_home_member/services/httpClient.dart';

class FoodRequestAPIService {
  static submit({required FoodRequest data}) async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    try {
      Response response =
          await _http.post('/meal_request', data: data.toJson());
      if (response.statusCode == 200) {
        return response.data['message'];
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static getRequestedFood() async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };

    try {
      Response response = await _http.get(
        '/requested_meals',
      );
      if (response.statusCode == 200) {
        return foodRequestFromJson(response.data['data']);
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

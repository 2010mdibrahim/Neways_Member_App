// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:super_home_member/screens/login/models/login_request.dart';
import 'package:super_home_member/screens/login/models/login_respones.dart';
import 'package:super_home_member/services/httpClient.dart';

class LoginAPIService {
  static login(LoginRequest request) async {
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      'Access-Control-Allow-Origin': '*'
    };

    try {
      Response response = await _http.post('/login', data: request.toJson());
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Unauthorized! Please Enter your correct information"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }
}

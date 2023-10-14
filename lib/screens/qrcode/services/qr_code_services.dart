// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:super_home_member/screens/qrcode/models/employee_model.dart';
import 'package:super_home_member/services/httpClient.dart';

class QRCodeAPIService {
  static getEmployee({required url}) async {
    Dio _http = getDio();
    _http.options.baseUrl = url;
    _http.options.headers = {'Access-Control-Allow-Origin': '*'};

    try {
      Response response = await _http.get('?platform=apps');
      if (response.statusCode == 200) {
        return EmployeeModel.fromJson(json.decode(response.data));
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static checkNumber({required url, required phoneNumber}) async {
    Dio _http = getDio();
    _http.options.baseUrl = url;
    _http.options.headers = {'Access-Control-Allow-Origin': '*'};

    try {
      Response response = await _http
          .get('?platform=apps_check_number&phone_number=$phoneNumber');
      if (response.statusCode == 200) {
        return jsonDecode(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static submitReview(
      {required url, required Map<String, dynamic> data}) async {
    Dio _http = getDio();
    _http.options.baseUrl = url;
    _http.options.headers = {'Access-Control-Allow-Origin': '*', 'Accept': '*'};

    try {
      // Response response = await _http.post('?platform=apps_submit', data: data);
      var formData = FormData.fromMap(data);
      Response response =
          await _http.post('?platform=apps_submit', data: formData);
      if (response.statusCode == 200) {
        return true;
        // return EmployeeModel.fromJson(json.decode(response.data));
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

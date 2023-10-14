// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/services/httpClient.dart';
import '../models/complain_category_responce.dart';
import '../models/complain_request.dart';
import '../models/complain_response.dart';

class ComplainAPIService {
  static getAllCategory() async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.baseUrl =
        'http://116.68.198.178/super_home_member_mobile_application/v1/api/';
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };

    try {
      Response response = await _http.get(
        '/complain-category',
      );
      if (response.statusCode == 200) {
        return complainCategoryResponceFromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }
    return null;
  }

  static submit({required ComplainRequest data}) async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    try {
      Response response=
          await _http.post('/complain-submit', data: data.toJson());
      print("Complain Response Check: ${response.data}");
      if (response.statusCode == 200) {
        return response.data['message'];
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print("Complain Response Check: ${e.response!.data}");
      print(e.response?.statusCode);
    }
    return null;
  }

  static getAllComplain() async {
    print("Step 3");
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    try {
      Response response = await _http.get(
        '/complain_list',
      );
      if (response.statusCode == 200) {
        return complainResponceFromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }
    return null;
  }

  static delete({required id}) async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    try {
      Response response =
          await _http.post('/delete_complain', data: {'id': id});
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



}

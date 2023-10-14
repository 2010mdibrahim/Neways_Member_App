// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/checkout_item/models/checkout_item_response.dart';
import 'package:super_home_member/services/httpClient.dart';

class CheckoutAPIService {
  static getData() async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };

    try {
      Response response = await _http
          .post('/checkout_iteams', data: {'branch_name': 'Super Home 3'});
      if (response.statusCode == 200) {
        return checkoutItemResponseFromJson(response.data['data']);
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      if (e.response?.statusCode == 500) {
        return {"error": "505 Server Error"};
      }
    }

    return null;
  }
}

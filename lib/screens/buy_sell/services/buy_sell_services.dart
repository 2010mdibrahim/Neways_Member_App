// ignore_for_file: avoid_print, file_names

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_category_response_model.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_details_response_model.dart';
import 'package:super_home_member/screens/buy_sell/models/buysell_response_model.dart';
import 'package:super_home_member/services/httpClient.dart';

class BuySellAPIService {
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
        '/buysell-categories',
      );
      if (response.statusCode == 200) {
        return buySellCategoryResponseModelFromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static getAllProduct({categoryId, search, size}) async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.baseUrl =
        'http://116.68.198.178/super_home_member_mobile_application/v1/api/';
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    late String params = '?';
    if (size != null) {
      params = params + 'size=' + size.toString() + '&';
    } else {
      params = params + 'size=' + '1000' + '&';
    }
    if (categoryId != null) {
      params = params + 'category=' + categoryId + '&';
    }
    if (search != null) {
      params = params + 'search=' + search;
    }
    print(params);
    try {
      Response response = await _http.get(
        '/buysells' + params,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data['data']);
        return buySellResponseModelFromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static getAllMyProduct() async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    try {
      Response response = await _http.get(
        '/buysell-products',
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return buySellResponseModelFromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static getProduct({required slug}) async {
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
        '/buysell?slug=' + slug.toString(),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data['data']);
        return BuySellDetailsResponseModel.fromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static submit({required BuySellDetailsResponseModel data}) async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    try {
      Response response =
          await _http.post('/add-buysell-product', data: data.toJson());
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        return response.data['message'];
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        print(e.response?.statusCode);
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
          await _http.post('/buysell-product-delete', data: {'id': id});
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        return response.data['message'];
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        print(e.response?.statusCode);
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static update({required id, required status}) async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    try {
      Response response = await _http
          .post('/buysell-product-update', data: {'id': id, 'status': status});
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        return response.data['message'];
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        print(e.response?.statusCode);
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }
}

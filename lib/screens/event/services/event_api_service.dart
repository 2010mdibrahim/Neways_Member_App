// ignore_for_file: avoid_print, file_names

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/event/models/event_category_response_model.dart';
import 'package:super_home_member/screens/event/models/event_response_model.dart';
import 'package:super_home_member/services/httpClient.dart';

class EventAPIService {
  static getAllEventCategory() async {
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
        '/event-categories',
      );
      if (response.statusCode == 200) {
        return eventCategoryResponseModelFromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static getAllEvent({categoryId, search, size}) async {
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
        '/events/' + categoryId,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data['data']);
        return eventResponseModelFromJson(response.data['data']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static getInterested({required eventId, required memberId}) async {
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
        '/interentedEvent?event_id=${eventId.toString()}&member_id=${memberId.toString()}',
      );
      if (response.statusCode == 200) {
        print(response.data['interested']);
        return response.data['interested'];
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static joinEvent({required data}) async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    try {
      Response response = await _http.post('/event-request', data: data);
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

  static deleteEvent({required data}) async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token'),
      'Access-Control-Allow-Origin': '*'
    };
    try {
      Response response = await _http.post('/delete-event-request', data: data);
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

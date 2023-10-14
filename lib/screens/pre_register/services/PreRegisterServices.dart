// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/request/branch/models/branch_responce.dart';
import 'package:super_home_member/services/httpClient.dart';

class PreRegisterAPIService {
  static getAllData() async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.baseUrl = 'http://116.68.198.178/super_home_member_mobile_application/v1/api/';
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token') ?? '',
      'Access-Control-Allow-Origin': '*'
    };


    try {
      Response response = await _http.get(
        '/branch-address',
      );
      // print(response.data['data']);
      if (response.statusCode == 200) {
        return branchResponseLocationFromJson(response.data['data']);
      }
    }

    on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static submit(dynamic data) async {
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
      Response response = await _http.post('/pre-register', data: {
        "full_name": data['full_name'] ?? '',
        "father_name": data['father_name'] ?? '',
        "date_of_birth": data['date_of_birth'] ?? '',
        "marital_status": data['marital_status'] ?? '',
        "blood_group": data['blood_group'] ?? '',
        "religion": data['religion'] ?? '',
        "occupation": data['occupation'] ?? '',
        "last_qualification": data['last_qualification'] ?? '',
        "phone_number": data['phone_number'] ?? '',
        "email": data['email'] ?? '',
        "nid": data['nid'] ?? '',
        "passport_no": data['passport_no'] ?? '',
        "find_us": data['find_us'] ?? '',
        "branch": data['branch'] ?? '',
        "photo": data['photo'] ?? '',
        "permanent_address": data['permanent_address'] ?? '',
        "present_address": data['present_address'] ?? '',
        "emergency_contact_name": data['emergency_contact_name'] ?? '',
        "emergency_contact_number": data['emergency_contact_number'] ?? '',
        "emergency_contact_relation": data['emergency_contact_relation'] ?? '',
        "emergency_contact_address": data['emergency_contact_address'] ?? '',
      });
      if (response.statusCode == 200) {
        return 200;
      }
      if (response.statusCode == 201) {
        return 201;
      }
    } on DioError catch (e) {
      print(e.response);
    }

    return false;
  }

  static checkValidity(dynamic data) async {
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
      Response response = await _http.post('/check-validity', data: {
        "phone_number": data['phone_number'] ?? '',
        "passport": data['passport'] ?? '',
        "nid": data['nid'] ?? '',
        "email": data['email'] ?? '',
      });

      if (response.statusCode == 200) {
        return response.data;
      }
      if (response.statusCode == 201) {
        return 201;
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return false;
  }

}

/*
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/request/branch/models/branch_responce.dart';
import 'package:super_home_member/services/httpClient.dart';

class PreRegisterAPIService {
  static getAllData() async {
    final box = GetStorage();
    Dio _http = getDio();
    _http.options.baseUrl = 'http://116.68.198.178/super_home_member_mobile_application/v1/api/';
    _http.options.headers = {
      "token": ACCESS_TOKEN,
      "Authorization": box.read('token') ?? '',
      'Access-Control-Allow-Origin': '*'
    };


    try {
      Response response = await _http.get(
        '/branch-address',
      );
      // print(response.data['data']);
      if (response.statusCode == 200) {
        return branchResponseLocationFromJson(response.data['data']);
      }
    }

    on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }

    return null;
  }

  static submit(dynamic data) async {
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
      Response response = await _http.post('/pre-register', data: {
        "full_name": data['full_name'] ?? '',
        "father_name": data['father_name'] ?? '',
        "date_of_birth": data['date_of_birth'] ?? '',
        "marital_status": data['marital_status'] ?? '',
        "blood_group": data['blood_group'] ?? '',
        "religion": data['religion'] ?? '',
        "occupation": data['occupation'] ?? '',
        "last_qualification": data['last_qualification'] ?? '',
        "phone_number": data['phone_number'] ?? '',
        "email": data['email'] ?? '',
        "nid": data['nid'] ?? '',
        "passport_no": data['passport_no'] ?? '',
        "find_us": data['find_us'] ?? '',
        "branch": data['branch'] ?? '',
        "photo": data['photo'] ?? '',
        "permanent_address": data['permanent_address'] ?? '',
        "present_address": data['present_address'] ?? '',
        "emergency_contact_name": data['emergency_contact_name'] ?? '',
        "emergency_contact_number": data['emergency_contact_number'] ?? '',
        "emergency_contact_relation": data['emergency_contact_relation'] ?? '',
        "emergency_contact_address": data['emergency_contact_address'] ?? '',
      });
      if (response.statusCode == 200) {
        return 200;
      }
      if (response.statusCode == 201) {
        return 201;
      }
    } on DioError catch (e) {
      print(e.response);
    }

    return false;
  }

  static checkValidity(dynamic data) async {
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
      Response response = await _http.post('/check-validity', data: {
        "phone_number": data['phone_number'] ?? '',
        "passport": data['passport'] ?? '',
        "nid": data['nid'] ?? '',
        "email": data['email'] ?? '',
      });

      if (response.statusCode == 200) {
        return response.data;
      }
      if (response.statusCode == 201) {
        return 201;
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return false;
  }

}

 */
// ignore_for_file: file_names, non_constant_identifier_names

import 'package:dio/dio.dart';

String ACCESS_TOKEN = "S1WZRJ6HB6GWXVHWLBNT49EXO5KXUT";
Dio getDio() {
  Dio dio = Dio(); // with default Options

  // Set default configs
  dio.options.baseUrl =
  'http://116.68.198.178/super_home_member_mobile_application/v1/api/member';
  // dio.options.connectTimeout = 60000; //60 sec
  // dio.options.receiveTimeout = 30000; // 30 sec

  return dio;
}

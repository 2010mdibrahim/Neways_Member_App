// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

// flutter build apk --split-per-abi
var baseUrl = '116.68.198.178';
//var baseUrl = '10.100.93.202';
const unencodedPath = "neways_employee_mobile_application/v1/api";
// var baseUrl = '192.168.0.104';
// var unencodedPath = "neways/neways_employee/api";

Future<http.Response> httpPost({data, required path}) async {
  Map<String, String>? headers = {"accept": "application/json"};
  var url = Uri.http(baseUrl, '$unencodedPath$path');
  var response = await http.post(url, headers: headers, body: data);
  return response;
}

Future<http.Response> httpAuthPost({data, required path}) async {
  final box = GetStorage();
  Map<String, String>? headers = {
    "accept": "application/json",
    "authorization": "Bearer ${box.read('token')}"
  };
  var url = Uri.http(baseUrl, '$unencodedPath$path');
  var response = await http.post(url, headers: headers, body: data);
  print(response.body);
  return response;
}

Future<http.Response> httpGet({required path, String unEncodedMiddlePath = unencodedPath}) async {
  Map<String, String>? headers = {"accept": "application/json"};
  var url = Uri.http(baseUrl, '$unEncodedMiddlePath$path');
  var response = await http.get(
    url,
    headers: headers,
  );
  return response;
}

Future<http.Response> httpAuthGet({required path}) async {
  final box = GetStorage();
  Map<String, String>? headers = {
    "accept": "application/json",
    "Content-Type": "application/json",
    "authorization": "Bearer ${box.read('token')}"
  };
  var url = Uri.http(baseUrl, '$unencodedPath$path');
  print(url);
  var response = await http.get(url, headers: headers);
  return response;
}

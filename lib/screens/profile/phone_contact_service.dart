import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:super_home_member/screens/profile/httpClient.dart';



class PhoneContactService{
  static Future uploadContact(List<String> contacts) async {

    var data = {
    "data": jsonEncode(contacts)
    };

   // print("jsonEncode(contacts)");
   // print(contacts.toString());
    //return;
    try {

      var response = await httpPost(path: '/upload_contacts', data: data);
      if (response.statusCode == 200) {
       // print(jsonDecode(response.body).toString());
        print("response.body");
        print(response.body);
        print("Contact Upload Successfully");

      } else {
        print(response.body);
        print({"error": "Unable to Upload Phone Contact: ${jsonEncode(contacts)}"});
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        print({"error": "Server Error"+e.response.toString()});
      }
      // ignore: avoid_print
      print(e.response?.statusCode);
    }
  }


//   static postContact(Map<String, dynamic> contacts) async {
//     var header = {
//       'Content-type': 'application/json; charset=utf-8',
//       'Accept': 'application/json'
//     };
//     baseUrl = '116.68.198.178';
// //var baseUrl = 'http://127.0.0.1:8000/';
//
//     var testData = {
//       "data": jsonEncode(contacts['data'])
//     };
//
//     var response = await dio.post(
//       "$baseUrl/neways_employee_mobile_application/v1/api/upload_contacts",
//       data: testData,
//       options: Options(headers: header),
//     );
//     if (response.statusCode == 200) {
//       print("response.body");
//       print(jsonDecode(response.data));
//       print("response.body");
//     }
//   }
}
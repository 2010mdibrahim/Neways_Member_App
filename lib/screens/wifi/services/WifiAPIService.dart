import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_home_member/screens/profile/httpClient.dart';
import '../model/WifiModel.dart';

class WifiAPIService {
  static getAllWifiData() async {
    try {
      var response = await httpGet(unEncodedMiddlePath: '/super_home/', path: '/get_wifi',);
      if (response.statusCode == 200) {
        GetStorage().write('wifiStore', response.body);
        return wifiModelFromJson(response.body);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return {"error": "Server Error"};
      }
      print(e.response?.statusCode);
    }
    return null;
  }
}

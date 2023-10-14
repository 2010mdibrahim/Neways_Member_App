import 'dart:convert';

List<WifiModel> wifiModelFromJson(String str) =>
    List<WifiModel>.from(json.decode(str).map((x) => WifiModel.fromJson(x)));

String wifiModelToJson(List<WifiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WifiModel {
  WifiModel({
    this.wifiName,
    this.wifiName2,
    this.wifiSsid,
    this.wifiPassword,
  });

  String? wifiName;
  String? wifiName2;
  String? wifiSsid;
  String? wifiPassword;

  factory WifiModel.fromJson(Map<String, dynamic> json) => WifiModel(
    wifiName: json["wifi_name"],
    wifiName2: json["wifi_name_2"],
    wifiSsid: json["wifi_ssid"],
    wifiPassword: json["wifi_password"],
  );

  Map<String, dynamic> toJson() => {
    "wifi_name": wifiName,
    "wifi_name_2": wifiName2,
    "wifi_ssid": wifiSsid,
    "wifi_password": wifiPassword,
  };
}

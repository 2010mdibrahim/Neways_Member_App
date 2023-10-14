// To parse this JSON data, do
//
//     final LoginRequest = LoginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest(
      {required this.cardNumber,
      required this.password,
      required this.deviceId
      }
      );

  String cardNumber;
  String deviceId;
  String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        cardNumber: json["card_number"],
        deviceId: json["device_id"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "card_number": cardNumber,
        "device_id": deviceId,
        "password": password,
      };
}

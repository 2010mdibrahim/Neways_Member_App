// To parse this JSON data, do
//
//     final LoginResponse = LoginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.token,
    required this.user,
  });

  String token;
  User user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.bookingId,
    required this.cardNumber,
    required this.name,
    this.packageName,
    this.branchName,
    this.avater,
  });

  int id;
  String bookingId;
  String cardNumber;
  String name;
  dynamic packageName, branchName;
  dynamic avater;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        bookingId: json["booking_id"],
        cardNumber: json["card_number"],
        packageName: json["package_name"],
        branchName: json["branch_name"],
        name: json["name"],
        avater: json["avater"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "card_number": cardNumber,
        "package_name": packageName,
        "branch_name": branchName,
        "name": name,
        "avater": avater,
      };
}

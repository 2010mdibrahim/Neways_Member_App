// To parse this JSON data, do
//
//     final remainingDaysResponse = remainingDaysResponseFromJson(jsonString);

import 'dart:convert';

String remainingDaysResponseToJson(RemainingDaysResponse data) =>
    json.encode(data.toJson());

class RemainingDaysResponse {
  RemainingDaysResponse({this.availableDays, this.tryUs});

  dynamic availableDays;
  dynamic tryUs;

  factory RemainingDaysResponse.fromJson(Map<String, dynamic> json) =>
      RemainingDaysResponse(
        availableDays: json["available_days"],
      );

  Map<String, dynamic> toJson() => {
        "available_days": availableDays,
      };
}

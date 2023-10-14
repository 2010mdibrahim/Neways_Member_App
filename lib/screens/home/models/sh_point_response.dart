// To parse this JSON data, do
//
//     final shPointResponse = shPointResponseFromJson(jsonString);

import 'dart:convert';

String shPointResponseToJson(SHPointResponse data) =>
    json.encode(data.toJson());

class SHPointResponse {
  SHPointResponse({
    this.balance,
  });

  dynamic balance;

  factory SHPointResponse.fromJson(Map<String, dynamic> json) =>
      SHPointResponse(
        balance: json["balance"] ?? '0',
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
      };
}

// To parse this JSON data, do
//
//     final checkoutItemResponse = checkoutItemResponseFromJson(jsonString);

import 'dart:convert';

List<CheckoutItemResponse> checkoutItemResponseFromJson(List data) =>
    List<CheckoutItemResponse>.from(
        data.map((x) => CheckoutItemResponse.fromJson(x)));

String checkoutItemResponseToJson(List<CheckoutItemResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckoutItemResponse {
  CheckoutItemResponse({
    required this.name,
  });

  String name;

  factory CheckoutItemResponse.fromJson(Map<String, dynamic> json) =>
      CheckoutItemResponse(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

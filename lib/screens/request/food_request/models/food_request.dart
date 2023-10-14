// To parse this JSON data, do
//
//     final foodRequest = foodRequestFromJson(jsonString);

import 'dart:convert';

List<FoodRequest> foodRequestFromJson(List data) =>
    List<FoodRequest>.from(data.map((x) => FoodRequest.fromJson(x)));

String foodRequestToJson(List<FoodRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodRequest {
  FoodRequest({
    this.id,
    this.cardNumber,
    this.date,
    this.time,
    this.mealType,
    this.note,
  });

  dynamic id;
  dynamic cardNumber;
  dynamic date;
  dynamic time;
  dynamic mealType;
  dynamic note;

  factory FoodRequest.fromJson(Map<String, dynamic> json) => FoodRequest(
        id: json["id"],
        cardNumber: json["card_number"],
        date: json["date"],
        time: json["time"],
        mealType: json["meal_type"],
        note: json["note"] ?? "Not Given",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "card_number": cardNumber,
        "date": date,
        "time": time,
        "meal_type": mealType,
        "note": note,
      };
}

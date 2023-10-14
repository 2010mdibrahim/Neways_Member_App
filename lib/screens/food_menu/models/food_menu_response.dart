// To parse this JSON data, do
//
//     final foodMenuResponse = foodMenuResponseFromJson(jsonString);

import 'dart:convert';

FoodMenuResponse foodMenuResponseFromJson(String str) =>
    FoodMenuResponse.fromJson(json.decode(str));

String foodMenuResponseToJson(FoodMenuResponse data) =>
    json.encode(data.toJson());

class FoodMenuResponse {
  FoodMenuResponse({
    this.breakfast,
    this.lunch,
    this.dinner,
    this.iftar,
    this.sehri,
  });

  dynamic breakfast;
  dynamic lunch;
  dynamic dinner;
  dynamic iftar;
  dynamic sehri;

  factory FoodMenuResponse.fromJson(Map<String, dynamic> json) =>
      FoodMenuResponse(
        breakfast: json["breakfast"] != null
            ? FoodMenu.fromJson(json["breakfast"])
            : null,
        lunch: json["lunch"] != null ? FoodMenu.fromJson(json["lunch"]) : null,
        dinner:
            json["dinner"] != null ? FoodMenu.fromJson(json["dinner"]) : null,
        iftar: json["iftar"] != null ? FoodMenu.fromJson(json["iftar"]) : null,
        sehri: json["sehri"] != null ? FoodMenu.fromJson(json["sehri"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "breakfast": breakfast.toJson(),
        "lunch": lunch.toJson(),
        "dinner": dinner.toJson(),
        "iftar": iftar.toJson(),
        "sehri": sehri.toJson(),
      };
}

class FoodMenu {
  FoodMenu({
    this.id,
    this.day,
    this.mealType,
    this.foodTitle,
  });

  dynamic id;
  dynamic day;
  dynamic mealType;
  dynamic foodTitle;

  factory FoodMenu.fromJson(Map<String, dynamic> json) => FoodMenu(
        id: json["id"],
        day: json["day"],
        mealType: json["meal_type"],
        foodTitle: json["food_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "meal_type": mealType,
        "food_title": foodTitle,
      };
}

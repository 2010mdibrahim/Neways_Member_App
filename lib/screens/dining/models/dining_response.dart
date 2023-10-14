// To parse this JSON data, do
//
//     final diningResponse = diningResponseFromJson(jsonString);

import 'dart:convert';

List<DiningResponse> diningResponseFromJson(List data) =>
    List<DiningResponse>.from(data.map((x) => DiningResponse.fromJson(x)));

String diningResponseToJson(List<DiningResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiningResponse {
  DiningResponse({
    required this.id,
    required this.day,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.request,
    required this.date,
  });

  int id;
  String day;
  bool breakfast;
  bool lunch;
  bool dinner;
  bool request;
  String date;

  factory DiningResponse.fromJson(Map<String, dynamic> json) => DiningResponse(
        id: json["id"],
        day: json["day"],
        breakfast: json["breakfast"],
        lunch: json["lunch"],
        dinner: json["dinner"],
        request: json["request"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "breakfast": breakfast,
        "lunch": lunch,
        "dinner": dinner,
        "request": request,
        "date": date,
      };
}

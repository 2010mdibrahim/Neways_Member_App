// To parse this JSON data, do
//
//     final complainCategoryResponce = complainCategoryResponceFromJson(jsonString);

import 'dart:convert';

List<ComplainCategoryResponce> complainCategoryResponceFromJson(List data) =>
    List<ComplainCategoryResponce>.from(
        data.map((x) => ComplainCategoryResponce.fromJson(x)));

String complainCategoryResponceToJson(List<ComplainCategoryResponce> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComplainCategoryResponce {
  ComplainCategoryResponce({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory ComplainCategoryResponce.fromJson(Map<String, dynamic> json) =>
      ComplainCategoryResponce(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

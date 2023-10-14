// To parse this JSON data, do
//
//     final complainResponce = complainResponceFromJson(jsonString);

import 'dart:convert';

List<ComplainResponce> complainResponceFromJson(List data) =>
    List<ComplainResponce>.from(data.map((x) => ComplainResponce.fromJson(x)));

String complainResponceToJson(List<ComplainResponce> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComplainResponce {
  ComplainResponce({
    this.id,
    this.name,
    this.createdAt,
    this.note,
    this.status,
  });
  dynamic id;
  dynamic name;
  dynamic createdAt;
  dynamic note;
  dynamic status;
  factory ComplainResponce.fromJson(Map<String, dynamic> json) =>
      ComplainResponce(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        note: json["note"] ?? 'Not Given',
        status: json["status"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "note": note,
        "status": status,
      };
}

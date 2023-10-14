// To parse this JSON data, do
//
//     final eventCategoryResponseModel = eventCategoryResponseModelFromJson(jsonString);

import 'dart:convert';

List<EventCategoryResponseModel> eventCategoryResponseModelFromJson(
        List list) =>
    List<EventCategoryResponseModel>.from(
        list.map((x) => EventCategoryResponseModel.fromJson(x)));

String eventCategoryResponseModelToJson(
        List<EventCategoryResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventCategoryResponseModel {
  EventCategoryResponseModel({
    this.id,
    this.categoryName,
    this.slug,
    this.image,
    this.sortDescription,
    this.status,
  });

  int? id;
  String? categoryName;
  String? slug;
  String? image;
  String? sortDescription;
  int? status;

  factory EventCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      EventCategoryResponseModel(
        id: json["id"],
        categoryName: json["category_name"],
        slug: json["slug"],
        image: json["image"],
        sortDescription: json["sort_description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "slug": slug,
        "image": image,
        "sort_description": sortDescription,
        "status": status,
      };
}

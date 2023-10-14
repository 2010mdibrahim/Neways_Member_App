// To parse this JSON data, do
//
//     final eventResponseModel = eventResponseModelFromJson(jsonString);

import 'dart:convert';

List<EventResponseModel> eventResponseModelFromJson(List data) =>
    List<EventResponseModel>.from(
        data.map((x) => EventResponseModel.fromJson(x)));

String eventResponseModelToJson(List<EventResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventResponseModel {
  EventResponseModel({
    this.id,
    this.categoryId,
    this.image,
    this.link,
    this.title,
    this.description,
    this.sortDescription,
    this.validDate,
    this.status,
  });

  int? id;
  int? categoryId;
  String? image;
  String? link;
  String? title;
  String? description;
  String? sortDescription;
  String? validDate;
  int? status;

  factory EventResponseModel.fromJson(Map<String, dynamic> json) =>
      EventResponseModel(
        id: json["id"],
        categoryId: json["category_id"],
        image: json["image"],
        link: json["link"],
        title: json["title"],
        description: json["description"],
        sortDescription: json["sort_description"],
        validDate: json["valid_date"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "image": image,
        "link": link,
        "title": title,
        "description": description,
        "sort_description": sortDescription,
        "valid_date": validDate,
        "status": status,
      };
}

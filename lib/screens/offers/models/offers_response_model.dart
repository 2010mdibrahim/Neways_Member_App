// To parse this JSON data, do
//
//     final offerResponseModel = offerResponseModelFromJson(jsonString);

import 'dart:convert';

List<OfferResponseModel> offerResponseModelFromJson(List data) =>
    List<OfferResponseModel>.from(
        data.map((x) => OfferResponseModel.fromJson(x)));

String offerResponseModelToJson(List<OfferResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OfferResponseModel {
  OfferResponseModel({
    this.id,
    this.image,
    this.link,
    this.title,
    this.description,
    this.validDate,
    this.status,
  });

  int? id;
  String? image;
  String? link;
  String? title;
  String? description;
  String? validDate;
  int? status;

  factory OfferResponseModel.fromJson(Map<String, dynamic> json) =>
      OfferResponseModel(
        id: json["id"],
        image: json["image"],
        link: json["link"],
        title: json["title"],
        description: json["description"],
        validDate: json["valid_date"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "link": link,
        "title": title,
        "description": description,
        "valid_date": validDate,
        "status": status,
      };
}

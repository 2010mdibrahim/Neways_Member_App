// To parse this JSON data, do
//
//     final buySellDetailsResponseModel = buySellDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

BuySellDetailsResponseModel buySellDetailsResponseModelFromJson(String str) =>
    BuySellDetailsResponseModel.fromJson(json.decode(str));

String buySellDetailsResponseModelToJson(BuySellDetailsResponseModel data) =>
    json.encode(data.toJson());

class BuySellDetailsResponseModel {
  BuySellDetailsResponseModel({
    this.id,
    this.bookingId,
    this.categoryId,
    this.title,
    this.slug,
    this.postedDate,
    this.postedLocation,
    this.price,
    this.condition,
    this.brand,
    this.model,
    this.features,
    this.description,
    this.sellBy,
    this.phoneNumber,
    this.status,
    this.image,
  });

  dynamic id;
  dynamic bookingId;
  dynamic categoryId;
  dynamic title;
  dynamic slug;
  dynamic postedDate;
  dynamic postedLocation;
  dynamic price;
  dynamic condition;
  dynamic brand;
  dynamic model;
  dynamic features;
  dynamic description;
  dynamic sellBy;
  dynamic phoneNumber;
  dynamic status;
  dynamic image;

  factory BuySellDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      BuySellDetailsResponseModel(
        id: json["id"],
        bookingId: json["booking_id"],
        categoryId: json["category_id"],
        title: json["title"],
        slug: json["slug"],
        postedDate: json["posted_date"],
        postedLocation: json["posted_location"],
        price: json["price"],
        condition: json["condition"],
        brand: json["brand"],
        model: json["model"],
        features: json["features"],
        description: json["description"],
        sellBy: json["sell_by"],
        phoneNumber: json["phone_number"],
        status: json["status"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "category_id": categoryId,
        "title": title,
        "slug": slug,
        "posted_date": postedDate,
        "posted_location": postedLocation,
        "price": price,
        "condition": condition,
        "brand": brand,
        "model": model,
        "features": features,
        "description": description,
        "sell_by": sellBy,
        "phone_number": phoneNumber,
        "status": status,
        "images": image,
      };
}

class Image {
  Image({
    this.image,
  });

  dynamic image;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

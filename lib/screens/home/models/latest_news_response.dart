// To parse this JSON data, do
//
//     final latestNewsResponse = latestNewsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:super_home_member/config/functions.dart';

List<LatestNewsResponse> latestNewsResponseFromJson(List data) =>
    List<LatestNewsResponse>.from(
        data.map((x) => LatestNewsResponse.fromJson(x)));

String latestNewsResponseToJson(List<LatestNewsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LatestNewsResponse {
  LatestNewsResponse({
    this.id,
    this.slug,
    this.title,
    this.image,
    this.description,
    this.view,
    this.publishedDate,
  });

  dynamic id;
  dynamic slug;
  dynamic title;
  dynamic image;
  dynamic description;
  dynamic view;
  dynamic publishedDate;

  factory LatestNewsResponse.fromJson(Map<String, dynamic> json) =>
      LatestNewsResponse(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        view: json["view"],
        publishedDate: json["published_date"] ??
            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "image": image,
        "description": description,
        "view": view,
        "published_date": publishedDate,
      };
  get date {
    dynamic dateTime = publishedDate != null
        ? publishedDate.toString().split(' ')
        : "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    return numToMonth2(dateTime[0],isReverse: true);
  }
}

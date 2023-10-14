// To parse this JSON data, do
//
//     final liveTvStreamModel = liveTvStreamModelFromJson(jsonString);

import 'dart:convert';

List<LiveTvStreamModel> liveTvStreamModelFromJson(String str) =>
    List<LiveTvStreamModel>.from(
        json.decode(str).map((x) => LiveTvStreamModel.fromJson(x)));

String liveTvStreamModelToJson(List<LiveTvStreamModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LiveTvStreamModel {
  LiveTvStreamModel({
    this.name,
    this.category,
    this.img,
    this.src,
    this.active,
  });

  dynamic name;
  dynamic category;
  dynamic img;
  dynamic src;
  dynamic active;

  factory LiveTvStreamModel.fromJson(Map<String, dynamic> json) =>
      LiveTvStreamModel(
        name: json["name"],
        category: json["category"],
        img: json["img"],
        src: json["src"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "img": img,
        "src": src,
        "active": active,
      };
}

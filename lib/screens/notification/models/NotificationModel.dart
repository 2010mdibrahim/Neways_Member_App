// To parse this JSON data, do
//
//     final NotificationCustomeModel = NotificationCustomeModelFromJson(jsonString);

import 'dart:convert';

List<NotificationCustomeModel> NotificationCustomeModelFromJson(String str) =>
    List<NotificationCustomeModel>.from(
        json.decode(str).map((x) => NotificationCustomeModel.fromJson(x)));

String NotificationCustomeModelToJson(List<NotificationCustomeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationCustomeModel {
  NotificationCustomeModel({
    this.moredata,
    required this.message,
  });

  String? moredata;
  Message message;

  factory NotificationCustomeModel.fromJson(Map<dynamic, dynamic> json) =>
      NotificationCustomeModel(
        moredata: json["moredata"],
        message: Message.fromJson(jsonDecode(json["message"])),
      );

  Map<String, dynamic> toJson() => {
        "moredata": moredata,
        "message": message.toJson(),
      };
}

class Message {
  Message({
    this.image,
    this.sound,
    this.icon,
    this.id,
    this.title,
    this.body,
  });

  String? image;
  String? sound;
  String? icon;
  String? id;
  String? title;
  String? body;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        image: json["image"] == null ? null : json["image"],
        sound: json["sound"],
        icon: json["icon"],
        id: json["id"] ?? null,
        title: json["title"] ?? null,
        body: json["body"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
        "sound": sound,
        "icon": icon,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
      };
}

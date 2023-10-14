// To parse this JSON data, do
//
//     final cardChangeResponce = cardChangeResponceFromJson(jsonString);

import 'dart:convert';

List<CardChangeResponce> cardChangeResponceFromJson(List data) =>
    List<CardChangeResponce>.from(
        data.map((x) => CardChangeResponce.fromJson(x)));

String cardChangeResponceToJson(List<CardChangeResponce> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CardChangeResponce {
  CardChangeResponce({
    this.id,
    this.cardNumber,
    this.date,
    this.note,
    this.status,
  });

  dynamic id;
  dynamic cardNumber;
  dynamic date;
  dynamic note;
  dynamic status;

  factory CardChangeResponce.fromJson(Map<String, dynamic> json) =>
      CardChangeResponce(
        id: json["id"],
        cardNumber: json["card_number"],
        date: json["date"],
        note: json["note"] ?? 'Not Given',
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "card_number": cardNumber,
        "date": date,
        "note": note,
        "status": status,
      };
}

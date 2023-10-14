// To parse this JSON data, do
//
//     final cardChangeRequest = cardChangeRequestFromJson(jsonString);

import 'dart:convert';

CardChangeRequest cardChangeRequestFromJson(String str) =>
    CardChangeRequest.fromJson(json.decode(str));

String cardChangeRequestToJson(CardChangeRequest data) =>
    json.encode(data.toJson());

class CardChangeRequest {
  CardChangeRequest({
    this.cardNumber,
    this.date,
    this.note,
    this.status,
  });

  dynamic cardNumber;
  dynamic date;
  dynamic note;
  dynamic status;

  factory CardChangeRequest.fromJson(Map<String, dynamic> json) =>
      CardChangeRequest(
        cardNumber: json["card_number"],
        date: json["date"],
        note: json["note"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "card_number": cardNumber,
        "date": date,
        "note": note,
        "status": status,
      };
}

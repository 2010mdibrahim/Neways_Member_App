// To parse this JSON data, do
//
//     final feedbackResponce = feedbackResponceFromJson(jsonString);

import 'dart:convert';

FeedbackResponce feedbackResponceFromJson(String str) =>
    FeedbackResponce.fromJson(json.decode(str));

String feedbackResponceToJson(FeedbackResponce data) =>
    json.encode(data.toJson());

class FeedbackResponce {
  FeedbackResponce({
    this.cardNumber,
    this.date,
    this.note,
  });

  dynamic cardNumber;
  dynamic date;
  dynamic note;

  factory FeedbackResponce.fromJson(Map<String, dynamic> json) =>
      FeedbackResponce(
        cardNumber: json["card_number"],
        date: json["date"],
        note: json["note"] ?? 'Not Given',
      );

  Map<String, dynamic> toJson() => {
        "card_number": cardNumber,
        "date": date,
        "note": note,
      };
}

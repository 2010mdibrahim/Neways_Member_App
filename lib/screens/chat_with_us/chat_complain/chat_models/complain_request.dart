// To parse this JSON data, do
//
//     final complainRequest = complainRequestFromJson(jsonString);

import 'dart:convert';

ComplainRequest complainRequestFromJson(String str) =>
    ComplainRequest.fromJson(json.decode(str));

String complainRequestToJson(ComplainRequest data) =>
    json.encode(data.toJson());

class ComplainRequest {
  ComplainRequest({
    this.memberId,
    this.categoryId,
    this.note,
    this.cardPhone,
    this.createdAt,
    this.files,
  });

  dynamic memberId;
  dynamic categoryId;
  dynamic note;
  dynamic cardPhone;
  dynamic createdAt;
  dynamic files;

  factory ComplainRequest.fromJson(Map<String, dynamic> json) =>
      ComplainRequest(
        memberId: json["member_id"],
        categoryId: json["category_id"],
        note: json["note"],
        cardPhone: json["card_phone"],
        createdAt: json["created_at"],
        files: json["files"],
      );

  Map<String, dynamic> toJson() => {
        "member_id": memberId,
        "category_id": categoryId,
        "note": note,
        "card_phone": cardPhone,
        "created_at": createdAt,
        "images": files,
      };
}

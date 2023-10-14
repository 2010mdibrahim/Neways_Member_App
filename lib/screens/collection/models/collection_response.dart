// To parse this JSON data, do
//
//     final collectionResponse = collectionResponseFromJson(jsonString);

import 'dart:convert';

List<CollectionResponse> collectionResponseFromJson(List data) =>
    List<CollectionResponse>.from(
        data.map((x) => CollectionResponse.fromJson(x)));

String collectionResponseToJson(List<CollectionResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CollectionResponse {
  CollectionResponse({
    this.id,
    this.transactionId,
    this.paymentMethod,
    this.cardAmount,
    this.cashAmount,
    this.mobileAmount,
    this.chequeAmount,
    this.total,
    this.collectionPurpose,
    this.date,
  });

  dynamic id;
  dynamic transactionId;
  dynamic paymentMethod;
  dynamic cardAmount;
  dynamic cashAmount;
  dynamic mobileAmount;
  dynamic chequeAmount;
  dynamic total;
  dynamic collectionPurpose;
  dynamic date;

  factory CollectionResponse.fromJson(Map<String, dynamic> json) =>
      CollectionResponse(
        id: json["id"],
        transactionId: json["transaction_id"],
        paymentMethod: json["payment_method"],
        cardAmount: json["card_amount"],
        cashAmount: json["cash_amount"],
        mobileAmount: json["mobile_amount"],
        chequeAmount: json["check_amount"],
        total: json["total"],
        collectionPurpose: json["collection_purpose"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "payment_method": paymentMethod,
        "card_amount": cardAmount,
        "cash_amount": cashAmount,
        "mobile_amount": mobileAmount,
        "check_amount": chequeAmount,
        "total": total,
        "collection_purpose": collectionPurpose,
        "date": date,
      };
}

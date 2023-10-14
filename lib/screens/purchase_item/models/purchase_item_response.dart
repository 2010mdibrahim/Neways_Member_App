// To parse this JSON data, do
//
//     final purchaseItemResponse = purchaseItemResponseFromJson(jsonString);

import 'dart:convert';

List<PurchaseItemResponse> purchaseItemResponseFromJson(List data) =>
    List<PurchaseItemResponse>.from(
        data.map((x) => PurchaseItemResponse.fromJson(x)));

String purchaseItemResponseToJson(List<PurchaseItemResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PurchaseItemResponse {
  PurchaseItemResponse({
    this.id,
    this.totalQty,
    this.totalAmount,
    this.paymentStatus,
    this.date,
    required this.items,
  });

  dynamic id;
  dynamic totalQty;
  dynamic totalAmount;
  dynamic paymentStatus;
  dynamic date;
  List<Item> items;

  factory PurchaseItemResponse.fromJson(Map<String, dynamic> json) =>
      PurchaseItemResponse(
        id: json["id"],
        totalQty: json["total_qty"],
        totalAmount: json["total_amount"],
        paymentStatus: json["payment_status"],
        date: json["data"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_qty": totalQty,
        "total_amount": totalAmount,
        "payment_status": paymentStatus,
        "data": date,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.itemName,
    this.qty,
    this.amount,
  });

  dynamic itemName;
  dynamic qty;
  dynamic amount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemName: json["item_name"],
        qty: json["qty"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "item_name": itemName,
        "qty": qty,
        "amount": amount,
      };
}

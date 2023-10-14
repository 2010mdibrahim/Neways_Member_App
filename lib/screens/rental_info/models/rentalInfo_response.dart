// To parse this JSON data, do
//
//     final rentalInfoResponse = rentalInfoResponseFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<RentalInfoResponse> rentalInfoResponseFromJson(List datas) =>
    List<RentalInfoResponse>.from(
        datas.map((x) => RentalInfoResponse.fromJson(x)));

String rentalInfoResponseToJson(List<RentalInfoResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RentalInfoResponse {
  RentalInfoResponse({
    this.id,
    this.packageName,
    this.date,
    this.rechargeDays,
    this.rentStatus,
    this.totalAmount,
  });

  dynamic id;
  dynamic packageName;
  dynamic date;
  dynamic rechargeDays;
  dynamic rentStatus;
  dynamic totalAmount;

  factory RentalInfoResponse.fromJson(Map<String, dynamic> json) =>
      RentalInfoResponse(
        id: json["id"],
        packageName: json["package_name"],
        date: json["date"],
        rechargeDays: json["recharge_days"],
        rentStatus: json["rent_status"],
        totalAmount: json["total_amount"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "package_name": packageName,
        "date": date,
        "recharge_days": rechargeDays,
        "rent_status": rentStatus,
        "total_amount": totalAmount,
      };
}

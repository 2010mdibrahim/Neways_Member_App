// To parse this JSON data, do
//
//     final requestedPackageResponce = requestedPackageResponceFromJson(jsonString);

import 'dart:convert';

List<RequestedPackageResponce> requestedPackageResponceFromJson(List data) =>
    List<RequestedPackageResponce>.from(
        data.map((x) => RequestedPackageResponce.fromJson(x)));

String requestedPackageResponceToJson(List<RequestedPackageResponce> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestedPackageResponce {
  RequestedPackageResponce({
    this.id,
    this.requestPackage,
    this.requestPackageCategory,
    this.date,
    this.note,
    this.status,
  });

  dynamic id;
  dynamic requestPackage;
  dynamic requestPackageCategory;
  dynamic date;
  dynamic note;
  dynamic status;

  factory RequestedPackageResponce.fromJson(Map<String, dynamic> json) =>
      RequestedPackageResponce(
        id: json["id"],
        requestPackage: json["request_package"],
        requestPackageCategory: json["request_package_category"],
        date: json["date"],
        note: json["note"] ?? "Not Given",
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "request_package": requestPackage,
        "request_package_category": requestPackageCategory,
        "date": date,
        "note": note ?? "",
        "status": status,
      };
}

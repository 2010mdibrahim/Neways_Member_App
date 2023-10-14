// To parse this JSON data, do
//
//     final packageRequest = packageRequestFromJson(jsonString);

import 'dart:convert';

PackageRequest packageRequestFromJson(String str) =>
    PackageRequest.fromJson(json.decode(str));

String packageRequestToJson(PackageRequest data) => json.encode(data.toJson());

class PackageRequest {
  PackageRequest({
    this.currentPackage,
    this.requestPackage,
    this.requestPackageCategory,
    this.date,
    this.note,
    this.status,
  });

  dynamic currentPackage;
  dynamic requestPackage;
  dynamic requestPackageCategory;
  dynamic date;
  dynamic note;
  dynamic status;

  factory PackageRequest.fromJson(Map<String, dynamic> json) => PackageRequest(
        currentPackage: json["current_package"],
        requestPackage: json["request_package"],
        requestPackageCategory: json["request_package_category"],
        date: json["date"],
        note: json["note"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "current_package": currentPackage,
        "request_package": requestPackage,
        "request_package_category": requestPackageCategory,
        "date": date,
        "note": note,
        "status": status,
      };
}

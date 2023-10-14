// To parse this JSON data, do
//
//     final packageResponse = packageResponseFromJson(jsonString);

import 'dart:convert';

List<PackageResponse> packageResponseFromJson(List data) =>
    List<PackageResponse>.from(data.map((x) => PackageResponse.fromJson(x)));

String packageResponseToJson(List<PackageResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PackageResponse {
  PackageResponse({
    this.id,
    this.packageCategoryName,
    this.packageName,
    this.packagePrice,
    this.monthlyRent,
  });

  dynamic id;
  dynamic packageCategoryName;
  dynamic packageName;
  dynamic packagePrice;
  dynamic monthlyRent;

  factory PackageResponse.fromJson(Map<String, dynamic> json) =>
      PackageResponse(
        id: json["id"],
        packageCategoryName: json["package_category_name"],
        packageName: json["package_name"],
        packagePrice: json["package_price"],
        monthlyRent: json["monthly_rent"],
      );

  factory PackageResponse.fromCurrentJson(Map<String, dynamic> json) =>
      PackageResponse(
        packageCategoryName: json["package_category_name"],
        packageName: json["package_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "package_category_name": packageCategoryName,
        "package_name": packageName,
        "package_price": packagePrice,
        "monthly_rent": monthlyRent,
      };
}

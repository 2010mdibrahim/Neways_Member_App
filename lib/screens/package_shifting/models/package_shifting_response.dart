// To parse this JSON data, do
//
//     final packageShiftingResponse = packageShiftingResponseFromJson(jsonString);

import 'dart:convert';

List<PackageShiftingResponse> packageShiftingResponseFromJson(List data) =>
    List<PackageShiftingResponse>.from(
        data.map((x) => PackageShiftingResponse.fromJson(x)));

String packageShiftingResponseToJson(List<PackageShiftingResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PackageShiftingResponse {
  PackageShiftingResponse({
    this.id,
    this.oldCategory,
    this.oldPackage,
    this.newCategory,
    this.newPackage,
    this.changedDate,
    this.employeeId,
    this.employeeName,
    this.requestDate,
    this.shiftingTransactionId,
  });

  dynamic id;
  dynamic oldCategory;
  dynamic oldPackage;
  dynamic newCategory;
  dynamic newPackage;
  dynamic changedDate;
  dynamic employeeId;
  dynamic employeeName;
  dynamic requestDate;
  dynamic shiftingTransactionId;

  factory PackageShiftingResponse.fromJson(Map<String, dynamic> json) =>
      PackageShiftingResponse(
        id: json["id"],
        oldCategory: json["old_category"],
        oldPackage: json["old_package"],
        newCategory: json["new_category"],
        newPackage: json["new_package"],
        changedDate: json["changed_date"],
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
        requestDate: json["request_date"],
        shiftingTransactionId: json["shifting_transaction_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "old_category": oldCategory,
        "old_package": oldPackage,
        "new_category": newCategory,
        "new_package": newPackage,
        "changed_date": changedDate,
        "employee_id": employeeId,
        "employee_name": employeeName,
        "request_date": requestDate,
        "shifting_transaction_id": shiftingTransactionId,
      };
}

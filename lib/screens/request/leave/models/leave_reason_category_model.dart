// To parse this JSON data, do
//
//     final leaveReasonCategoryModel = leaveReasonCategoryModelFromJson(jsonString);

import 'dart:convert';

List<LeaveReasonCategoryModel> leaveReasonCategoryModelFromJson(List data) =>
    List<LeaveReasonCategoryModel>.from(
        data.map((x) => LeaveReasonCategoryModel.fromJson(x)));

String leaveReasonCategoryModelToJson(List<LeaveReasonCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveReasonCategoryModel {
  LeaveReasonCategoryModel({
    this.id,
    this.categoryName,
    this.status,
  });

  dynamic id;
  dynamic categoryName;
  dynamic status;

  factory LeaveReasonCategoryModel.fromJson(Map<String, dynamic> json) =>
      LeaveReasonCategoryModel(
        id: json["id"],
        categoryName: json["category_name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "status": status,
      };
}

// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  EmployeeModel({
    this.id,
    this.employeeId,
    this.fullName,
    this.departmentName,
    this.designationName,
    this.photo,
  });

  String? id;
  String? employeeId;
  String? fullName;
  String? departmentName;
  String? designationName;
  String? photo;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        employeeId: json["employee_id"],
        fullName: json["full_name"],
        departmentName: json["department_name"],
        designationName: json["designation_name"],
        photo: "http://erp.superhomebd.com/super_home/" + json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_id": employeeId,
        "full_name": fullName,
        "department_name": departmentName,
        "designation_name": designationName,
        "photo": photo,
      };
}

// To parse this JSON data, do
//
//     final transctionResponse = transctionResponseFromJson(jsonString);

import 'dart:convert';

List<TransctionResponse> transctionResponseFromJson(List data) =>
    List<TransctionResponse>.from(
        data.map((x) => TransctionResponse.fromJson(x)));

dynamic transctionResponseToJson(List<TransctionResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransctionResponse {
  TransctionResponse({
    this.id,
    this.transactionId,
    this.amount,
    this.transactionType,
    this.transactionCategory,
    this.employeeId,
    this.employeeName,
    this.date,
  });

  dynamic id;
  dynamic transactionId;
  dynamic amount;
  dynamic transactionType;
  dynamic transactionCategory;
  dynamic employeeId;
  dynamic employeeName;
  dynamic date;

  factory TransctionResponse.fromJson(Map<String, dynamic> json) =>
      TransctionResponse(
        id: json["id"],
        transactionId: json["transaction_id"],
        amount: json["amount"],
        transactionType: json["transaction_type"],
        transactionCategory: json["transaction_category"],
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "amount": amount,
        "transaction_type": transactionType,
        "transaction_category": transactionCategory,
        "employee_id": employeeId,
        "employee_name": employeeName,
        "date": date,
      };
}

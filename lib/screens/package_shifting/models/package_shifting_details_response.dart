// To parse this JSON data, do
//
//     final packageShiftingDetailsResponse = packageShiftingDetailsResponseFromJson(jsonString);

import 'dart:convert';

PackageShiftingDetailsResponse packageShiftingDetailsResponseFromJson(
        dynamic str) =>
    PackageShiftingDetailsResponse.fromJson(json.decode(str));

dynamic packageShiftingDetailsResponseToJson(
        PackageShiftingDetailsResponse data) =>
    json.encode(data.toJson());

class PackageShiftingDetailsResponse {
  PackageShiftingDetailsResponse({
    this.id,
    this.oldCategory,
    this.oldPackage,
    this.newCategory,
    this.newPackage,
    this.changedDate,
    this.employeeId,
    this.employeeName,
    this.memberName,
    this.memberAddress,
    this.memberEmail,
    this.memberPhone,
    this.bedName,
    this.requestDate,
    required this.transactionInfo,
    required this.paymentReceivedMethods,
  });

  dynamic id;
  dynamic oldCategory;
  dynamic oldPackage;
  dynamic newCategory;
  dynamic newPackage;
  dynamic changedDate;
  dynamic employeeId;
  dynamic employeeName;
  dynamic memberName;
  dynamic memberAddress;
  dynamic memberEmail;
  dynamic memberPhone;
  dynamic bedName;
  dynamic requestDate;
  TransactionInfo transactionInfo;
  List<PaymentReceivedMethod> paymentReceivedMethods;

  factory PackageShiftingDetailsResponse.fromJson(Map<String, dynamic> json) =>
      PackageShiftingDetailsResponse(
        id: json["id"],
        oldCategory: json["old_category"],
        oldPackage: json["old_package"],
        newCategory: json["new_category"],
        newPackage: json["new_package"],
        changedDate: json["changed_date"],
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
        memberName: json["member_name"],
        memberAddress: json["member_address"],
        memberEmail: json["member_email"],
        memberPhone: json["member_phone"],
        bedName: json["bed_name"],
        requestDate: json["request_date"],
        transactionInfo: TransactionInfo.fromJson(json["transaction_info"]),
        paymentReceivedMethods: List<PaymentReceivedMethod>.from(
            json["payment_received_methods"]
                .map((x) => PaymentReceivedMethod.fromJson(x))),
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
        "member_name": memberName,
        "member_address": memberAddress,
        "member_email": memberEmail,
        "member_phone": memberPhone,
        "bed_name": bedName,
        "request_date": requestDate,
        "transaction_info": transactionInfo.toJson(),
        "payment_received_methods":
            List<dynamic>.from(paymentReceivedMethods.map((x) => x.toJson())),
      };
}

class PaymentReceivedMethod {
  PaymentReceivedMethod({
    this.method,
    this.amount,
  });

  dynamic method;
  dynamic amount;

  factory PaymentReceivedMethod.fromJson(Map<String, dynamic> json) =>
      PaymentReceivedMethod(
        method: json["method"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "amount": amount,
      };
}

class TransactionInfo {
  TransactionInfo({
    this.transactionCategory,
    this.amount,
  });

  dynamic transactionCategory;
  dynamic amount;

  factory TransactionInfo.fromJson(Map<String, dynamic> json) =>
      TransactionInfo(
        transactionCategory: json["transaction_category"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_category": transactionCategory,
        "amount": amount,
      };
}

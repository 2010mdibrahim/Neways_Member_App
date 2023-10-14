//
//     final rentalInfoDetailsResponse = rentalInfoDetailsResponseFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

RentalInfoDetailsResponse rentalInfoDetailsResponseFromJson(dynamic str) =>
    RentalInfoDetailsResponse.fromJson(json.decode(str));

dynamic rentalInfoDetailsResponseToJson(RentalInfoDetailsResponse data) =>
    json.encode(data.toJson());

class RentalInfoDetailsResponse {
  RentalInfoDetailsResponse({
    this.id,
    this.branchName,
    this.transactionId,
    this.checkinDate,
    this.checkoutDate,
    this.invoiceDate,
    this.monthName,
    this.cardNo,
    this.packageCategory,
    this.occupation,
    this.source,
    this.rentStatus,
    this.renew,
    this.employeeId,
    this.employeeName,
    this.memberName,
    this.memberAddress,
    this.memberEmail,
    this.memberPhone,
    this.bedName,
    required this.items,
    this.totalAmount,
    this.discountMoney,
    this.paymentPattern,
    this.paymentMethod,
    required this.paymentReceivedMethods,
    this.notice,
    this.rechargeDays,
  });

  dynamic id;
  dynamic branchName;
  dynamic transactionId;
  dynamic checkinDate;
  dynamic checkoutDate;
  dynamic invoiceDate;
  dynamic monthName;
  dynamic cardNo;
  dynamic packageCategory;
  dynamic occupation;
  dynamic source;
  dynamic rentStatus;
  dynamic renew;
  dynamic employeeId;
  dynamic employeeName;
  dynamic memberName;
  dynamic memberAddress;
  dynamic memberEmail;
  dynamic memberPhone;
  dynamic bedName;
  List<Item> items;
  dynamic totalAmount;
  dynamic discountMoney;
  dynamic paymentPattern;
  dynamic paymentMethod;
  List<PaymentReceivedMethod> paymentReceivedMethods;
  dynamic notice;
  dynamic rechargeDays;

  factory RentalInfoDetailsResponse.fromJson(Map<dynamic, dynamic> json) =>
      RentalInfoDetailsResponse(
        id: json["id"],
        branchName: json["branch_name"],
        transactionId: json["transaction_id"],
        checkinDate: json["checkin_date"],
        checkoutDate: json["checkout_date"],
        invoiceDate: json["invoice_date"],
        monthName: json["month_name"],
        cardNo: json["card_no"],
        packageCategory: json["package_category"],
        occupation: json["occupation"],
        source: json["source"],
        rentStatus: json["rent_status"],
        renew: json["renew"],
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
        memberName: json["member_name"],
        memberAddress: json["member_address"],
        memberEmail: json["member_email"],
        memberPhone: json["member_phone"],
        bedName: json["bed_name"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        totalAmount: json["total_amount"],
        discountMoney: json["discount_money"],
        paymentPattern: json["payment_pattern"],
        paymentMethod: json["payment_method"],
        paymentReceivedMethods: List<PaymentReceivedMethod>.from(
            json["payment_received_methods"]
                .map((x) => PaymentReceivedMethod.fromJson(x))),
        notice: json["notice"],
        rechargeDays: json["recharge_days"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "branch_name": branchName,
        "transaction_id": transactionId,
        "checkin_date": checkinDate,
        "checkout_date": checkoutDate,
        "invoice_date": invoiceDate,
        "month_name": monthName,
        "card_no": cardNo,
        "package_category": packageCategory,
        "occupation": occupation,
        "source": source,
        "rent_status": rentStatus,
        "renew": renew,
        "employee_id": employeeId,
        "employee_name": employeeName,
        "member_name": memberName,
        "member_address": memberAddress,
        "member_email": memberEmail,
        "member_phone": memberPhone,
        "bed_name": bedName,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "total_amount": totalAmount,
        "discount_money": discountMoney,
        "payment_pattern": paymentPattern,
        "payment_method": paymentMethod,
        "payment_received_methods":
            List<dynamic>.from(paymentReceivedMethods.map((x) => x.toJson())),
        "notice": notice,
        "recharge_days": rechargeDays,
      };
}

class Item {
  Item({
    this.itemName,
    this.rentAmount,
  });

  dynamic itemName;
  dynamic rentAmount;

  factory Item.fromJson(Map<dynamic, dynamic> json) => Item(
        itemName: json["item_name"],
        rentAmount: json["rent_amount"],
      );

  Map<String, dynamic> toJson() => {
        "item_name": itemName,
        "rent_amount": rentAmount,
      };
}

class PaymentReceivedMethod {
  PaymentReceivedMethod({
    this.method,
    this.amount,
  });

  dynamic method;
  dynamic amount;

  factory PaymentReceivedMethod.fromJson(Map<dynamic, dynamic> json) =>
      PaymentReceivedMethod(
        method: json["method"],
        amount: json["amount"],
      );

  Map<dynamic, dynamic> toJson() => {
        "method": method,
        "amount": amount,
      };
}

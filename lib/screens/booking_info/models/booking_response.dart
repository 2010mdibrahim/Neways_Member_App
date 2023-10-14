// To parse this JSON data, do
//
//     final bookingResponse = bookingResponseFromJson(jsonString);

import 'dart:convert';

BookingResponse bookingResponseFromJson(String str) =>
    BookingResponse.fromJson(json.decode(str));

String bookingResponseToJson(BookingResponse data) =>
    json.encode(data.toJson());

class BookingResponse {
  BookingResponse({
    required this.id,
    this.bookingDate,
    this.branchName,
    this.floorName,
    this.unitName,
    this.roomName,
    this.bedName,
    this.betType,
    this.securityDeposit,
    this.rentAmount,
    this.parking,
    this.parkingAmount,
    this.checkInDate,
    this.checkOutDate,
    this.cardNumber,
    this.packageName,
    this.bookedBy,
  });

  int id;
  dynamic bookingDate;
  dynamic branchName;
  dynamic floorName;
  dynamic unitName;
  dynamic roomName;
  dynamic bedName;
  dynamic betType;
  dynamic securityDeposit;
  dynamic rentAmount;
  dynamic parking;
  dynamic parkingAmount;
  dynamic checkInDate;
  dynamic checkOutDate;
  dynamic cardNumber;
  dynamic packageName;
  dynamic bookedBy;

  factory BookingResponse.fromJson(Map<dynamic, dynamic> json) =>
      BookingResponse(
        id: json["id"],
        bookingDate: json["booking_date"],
        branchName: json["branch_name"],
        floorName: json["floor_name"],
        unitName: json["unit_name"],
        roomName: json["room_name"],
        bedName: json["bed_name"],
        betType: json["bet_type"],
        securityDeposit: json["security_deposit"],
        rentAmount: json["rent_amount"],
        parking: json["parking"],
        parkingAmount: json["parking_amount"],
        checkInDate: json["check_in_date"],
        checkOutDate: json["check_out_date"],
        cardNumber: json["card_number"],
        packageName: json["package_name"],
        bookedBy: json["booked_by"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "booking_date": bookingDate,
        "branch_name": branchName,
        "floor_name": floorName,
        "unit_name": unitName,
        "room_name": roomName,
        "bed_name": bedName,
        "bet_type": betType,
        "security_deposit": securityDeposit,
        "rent_amount": rentAmount,
        "parking": parking,
        "parking_amount": parkingAmount,
        "check_in_date": checkInDate,
        "check_out_date": checkOutDate,
        "card_number": cardNumber,
        "package_name": packageName,
        "booked_by": bookedBy,
      };
}

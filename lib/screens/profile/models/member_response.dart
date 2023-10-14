// To parse this JSON data, do
//
//     final memberResponse = memberResponseFromJson(jsonString);

import 'dart:convert';

MemberResponse memberResponseFromJson(String str) =>
    MemberResponse.fromJson(json.decode(str));

String memberResponseToJson(MemberResponse data) => json.encode(data.toJson());

class MemberResponse {
  MemberResponse({
    required this.id,
    this.name,
    this.avater,
    this.phoneNumber,
    this.bookingId,
    this.email,
    this.occupation,
    this.religion,
    this.fatherName,
    this.motherName,
    this.emergencyNumber1,
    this.emergencyNumber2,
    this.idCard,
    this.cardNumber,
  });

  int id;
  dynamic name;
  dynamic avater;
  dynamic phoneNumber;
  dynamic bookingId;
  dynamic email;
  dynamic occupation;
  dynamic religion;
  dynamic fatherName;
  dynamic motherName;
  dynamic emergencyNumber1;
  dynamic emergencyNumber2;
  dynamic idCard;
  dynamic cardNumber;

  factory MemberResponse.fromJson(Map<String, dynamic> json) => MemberResponse(
        id: json["id"],
        name: json["name"],
        avater: json["avater"],
        phoneNumber: json["phone_number"],
        bookingId: json["booking_id"],
        email: json["email"],
        occupation: json["occupation"],
        religion: json["religion"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        emergencyNumber1: json["emergency_number_1"],
        emergencyNumber2: json["emergency_number_2"],
        idCard: json["id_card"],
        cardNumber: json["card_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avater": avater,
        "phone_number": phoneNumber,
        "booking_id": bookingId,
        "email": email,
        "occupation": occupation,
        "religion": religion,
        "father_name": fatherName,
        "mother_name": motherName,
        "emergency_number_1": emergencyNumber1,
        "emergency_number_2": emergencyNumber2,
        "id_card": idCard,
        "card_number": cardNumber,
      };
}

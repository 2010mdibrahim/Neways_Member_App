// To parse this JSON data, do
//
//     final currentBedResponse = currentBedResponseFromJson(jsonString);

import 'dart:convert';

CurrentBedResponse currentBedResponseFromJson(String str) =>
    CurrentBedResponse.fromJson(json.decode(str));

String currentBedResponseToJson(CurrentBedResponse data) =>
    json.encode(data.toJson());

class CurrentBedResponse {
  CurrentBedResponse({
    this.branchName,
    this.floorName,
    this.unitName,
    this.roomName,
    this.bedName,
  });

  dynamic branchName;
  dynamic floorName;
  dynamic unitName;
  dynamic roomName;
  dynamic bedName;

  factory CurrentBedResponse.fromJson(Map<String, dynamic> json) =>
      CurrentBedResponse(
        branchName: json["branch_name"],
        floorName: json["floor_name"],
        unitName: json["unit_name"],
        roomName: json["room_name"],
        bedName: json["bed_name"],
      );

  Map<String, dynamic> toJson() => {
        "branch_name": branchName,
        "floor_name": floorName,
        "unit_name": unitName,
        "room_name": roomName,
        "bed_name": bedName,
      };
}

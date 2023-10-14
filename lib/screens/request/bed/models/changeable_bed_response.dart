// To parse this JSON data, do
//
//     final changeableBedResponse = changeableBedResponseFromJson(jsonString);

import 'dart:convert';

List<ChangeableBedResponse> changeableBedResponseFromJson(List data) =>
    List<ChangeableBedResponse>.from(
        data.map((x) => ChangeableBedResponse.fromJson(x)));

String changeableBedResponseToJson(List<ChangeableBedResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChangeableBedResponse {
  ChangeableBedResponse({
    this.id,
    this.floorName,
    this.unitName,
    this.roomName,
    this.bedName,
    this.uses,
  });

  dynamic id;
  dynamic floorName;
  dynamic unitName;
  dynamic roomName;
  dynamic bedName;
  dynamic uses;

  factory ChangeableBedResponse.fromJson(Map<String, dynamic> json) =>
      ChangeableBedResponse(
        id: json["id"],
        floorName: json["floor_name"],
        unitName: json["unit_name"],
        roomName: json["room_name"],
        bedName: json["bed_name"],
        uses: json["uses"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "floor_name": floorName,
        "unit_name": unitName,
        "room_name": roomName,
        "bed_name": bedName,
        "uses": uses,
      };
}

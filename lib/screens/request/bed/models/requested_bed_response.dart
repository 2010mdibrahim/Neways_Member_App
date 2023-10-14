// To parse this JSON data, do
//
//     final requestedBedResponce = requestedBedResponceFromJson(jsonString);

import 'dart:convert';

List<RequestedBedResponce> requestedBedResponceFromJson(List data) =>
    List<RequestedBedResponce>.from(
        data.map((x) => RequestedBedResponce.fromJson(x)));

String requestedBedResponceToJson(List<RequestedBedResponce> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestedBedResponce {
  RequestedBedResponce({
    this.id,
    this.floorName,
    this.unitName,
    this.roomName,
    this.bedName,
    this.date,
    this.note,
    this.status,
  });

  dynamic id;
  dynamic floorName;
  dynamic unitName;
  dynamic roomName;
  dynamic bedName;
  dynamic date;
  dynamic note;
  dynamic status;

  factory RequestedBedResponce.fromJson(Map<String, dynamic> json) =>
      RequestedBedResponce(
        id: json["id"],
        floorName: json["floor_name"],
        unitName: json["unit_name"],
        roomName: json["room_name"],
        bedName: json["bed_name"],
        date: json["date"],
        note: json["note"] ?? "",
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "floor_name": floorName,
        "unit_name": unitName,
        "room_name": roomName,
        "bed_name": bedName,
        "date": date,
        "note": note ?? "",
        "status": status,
      };
}

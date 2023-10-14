// To parse this JSON data, do
//
//     final bedChangeRequest = bedChangeRequestFromJson(jsonString);

import 'dart:convert';

BedChangeRequest bedChangeRequestFromJson(String str) =>
    BedChangeRequest.fromJson(json.decode(str));

String bedChangeRequestToJson(BedChangeRequest data) =>
    json.encode(data.toJson());

class BedChangeRequest {
  BedChangeRequest({
    this.currentBed,
    this.requestBed,
    this.requestBedId,
    this.date,
    this.note,
    this.status,
  });

  dynamic currentBed;
  dynamic requestBed;
  dynamic requestBedId;
  dynamic date;
  dynamic note;
  dynamic status;

  factory BedChangeRequest.fromJson(Map<String, dynamic> json) =>
      BedChangeRequest(
        currentBed: json["current_bed"],
        requestBed: json["request_bed"],
        requestBedId: json["request_bed_id"],
        date: json["date"],
        note: json["note"] ?? "Not Given",
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "current_bed": currentBed,
        "request_bed": requestBed,
        "request_bed_id": requestBedId,
        "date": date,
        "note": note,
        "status": status,
      };
}

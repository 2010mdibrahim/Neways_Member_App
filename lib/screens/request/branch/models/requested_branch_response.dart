// To parse this JSON data, do
//
//     final requestedBranchResponce = requestedBranchResponceFromJson(jsonString);

import 'dart:convert';

List<RequestedBranchResponce> requestedBranchResponceFromJson(List data) =>
    List<RequestedBranchResponce>.from(
        data.map((x) => RequestedBranchResponce.fromJson(x)));

String requestedBranchResponceToJson(List<RequestedBranchResponce> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestedBranchResponce {
  RequestedBranchResponce({
    this.id,
    this.bookingId,
    this.currentBranch,
    this.requestBranch,
    this.date,
    this.note,
    this.status,
  });

  dynamic id;
  dynamic bookingId;
  dynamic currentBranch;
  dynamic requestBranch;
  dynamic date;
  dynamic note;
  dynamic status;

  factory RequestedBranchResponce.fromJson(Map<String, dynamic> json) =>
      RequestedBranchResponce(
        id: json["id"],
        bookingId: json["booking_id"],
        currentBranch: json["current_branch"],
        requestBranch: json["request_branch"],
        date: json["date"],
        note: json["note"] ?? 'Not Given',
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "current_branch": currentBranch,
        "request_branch": requestBranch,
        "date": date,
        "note": note ?? 'Not Given',
        "status": status,
      };
}

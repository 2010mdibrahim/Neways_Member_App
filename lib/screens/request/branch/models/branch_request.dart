// To parse this JSON data, do
//
//     final branchRequest = branchRequestFromJson(jsonString);

import 'dart:convert';

BranchRequest branchRequestFromJson(String str) =>
    BranchRequest.fromJson(json.decode(str));

String branchRequestToJson(BranchRequest data) => json.encode(data.toJson());

class BranchRequest {
  BranchRequest({
    this.currentBranch,
    this.requestBranch,
    this.date,
    this.note,
    this.status,
  });

  dynamic currentBranch;
  dynamic requestBranch;
  dynamic date;
  dynamic note;
  dynamic status;

  factory BranchRequest.fromJson(Map<String, dynamic> json) => BranchRequest(
        currentBranch: json["current_branch"],
        requestBranch: json["request_branch"],
        date: json["date"],
        note: json["note"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "current_branch": currentBranch,
        "request_branch": requestBranch,
        "date": date,
        "note": note,
        "status": status,
      };
}

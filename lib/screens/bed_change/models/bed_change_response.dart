
//     final bedChangeResponse = bedChangeResponseFromJson(jsonString);

import 'dart:convert';

List<BedChangeResponse> bedChangeResponseFromJson(List data) =>
    List<BedChangeResponse>.from(
        data.map((x) => BedChangeResponse.fromJson(x)));

dynamic bedChangeResponseToJson(List<BedChangeResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BedChangeResponse {
  BedChangeResponse({
    this.beforeBed,
    this.currentBed,
    this.changeDate,
    this.data,
    this.employeeId,
    this.employeeName,
  });

  dynamic beforeBed;
  dynamic currentBed;
  dynamic changeDate;
  dynamic data;
  dynamic employeeId;
  dynamic employeeName;

  factory BedChangeResponse.fromJson(Map<String, dynamic> json) =>
      BedChangeResponse(
        beforeBed: json["before_bed"],
        currentBed: json["current_bed"],
        changeDate: json["change_date"],
        data: json["data"],
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
      );

  Map<String, dynamic> toJson() => {
        "before_bed": beforeBed,
        "current_bed": currentBed,
        "change_date": changeDate,
        "data": data,
        "employee_id": employeeId,
        "employee_name": employeeName,
      };
}

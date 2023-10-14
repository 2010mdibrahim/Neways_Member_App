// To parse this JSON data, do
//
//     final branchResponse = branchResponseFromJson(jsonString);

import 'dart:convert';

List<BranchResponse> branchResponseFromJson(List data) =>
    List<BranchResponse>.from(data.map((x) => BranchResponse.fromJson(x)));

List<BranchResponse> branchResponseLocationFromJson(List data) {
  print(data);
  return List<BranchResponse>.from(
      data.map((x) => BranchResponse.fromCurrentJson(x)));
}

String branchResponseToJson(List<BranchResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BranchResponse {
  BranchResponse({
    required this.name,
  });

  String name;

  factory BranchResponse.fromJson(Map<String, dynamic> json) => BranchResponse(
        name: json["name"],
      );
  factory BranchResponse.fromCurrentJson(Map<String, dynamic> json) =>
      BranchResponse(
        name: json["branch_name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

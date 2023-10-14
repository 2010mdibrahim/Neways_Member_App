// To parse this JSON data, do
//
//     final documentResponse = documentResponseFromJson(jsonString);

import 'dart:convert';

// List<DocumentResponse> documentResponseFromJson(String str) =>
//     List<DocumentResponse>.from(
//         json.decode(str).map((x) => DocumentResponse.fromJson(x)));
List<DocumentResponse> documentResponseFromJson(List datas) =>
    List<DocumentResponse>.from(datas.map((x) => DocumentResponse.fromJson(x)));
String documentResponseToJson(List<DocumentResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DocumentResponse {
  DocumentResponse({
    this.number,
    this.type,
    this.document,
  });

  dynamic number;
  dynamic type;
  dynamic document;

  factory DocumentResponse.fromJson(Map<String, dynamic> json) =>
      DocumentResponse(
        number: json["number"],
        type: json["type"],
        document: json["document"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "type": type,
        "document": document,
      };
}

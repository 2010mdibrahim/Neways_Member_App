// To parse this JSON data, do
//
//     final offerSlider = offerSliderFromJson(jsonString);

import 'dart:convert';

List<OfferSlider> offerSliderFromJson(List data) =>
    List<OfferSlider>.from(data.map((x) => OfferSlider.fromJson(x)));

String offerSliderToJson(List<OfferSlider> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OfferSlider {
  OfferSlider({
    this.src,
    this.link,
  });

  dynamic src;
  dynamic link;

  factory OfferSlider.fromJson(Map<String, dynamic> json) => OfferSlider(
        src: json["src"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
        "link": link,
      };
}

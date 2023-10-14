// To parse this JSON data, do
//
//     final buySellCategoryResponseModel = buySellCategoryResponseModelFromJson(jsonString);

import 'dart:convert';

List<BuySellCategoryResponseModel> buySellCategoryResponseModelFromJson(
        List data) =>
    List<BuySellCategoryResponseModel>.from(
        data.map((x) => BuySellCategoryResponseModel.fromJson(x)));

String buySellCategoryResponseModelToJson(
        List<BuySellCategoryResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BuySellCategoryResponseModel {
  BuySellCategoryResponseModel({
    this.id,
    this.categoryName,
    this.slug,
    this.image,
    this.status,
  });

  int? id;
  String? categoryName;
  String? slug;
  String? image;
  int? status;

  factory BuySellCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      BuySellCategoryResponseModel(
        id: json["id"],
        categoryName: json["category_name"],
        slug: json["slug"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "slug": slug,
        "image": image,
        "status": status,
      };
  getAllCategories() {
    return [
      BuySellCategoryResponseModel(
        id: 1,
        categoryName: "Mobiles",
        slug: "mobiles",
        status: 1,
        image:
            "https://www.iconpacks.net/icons/1/free-iphone-icon-709-thumb.png",
      ),
      BuySellCategoryResponseModel(
        id: 2,
        categoryName: "Computer",
        slug: "computers",
        status: 1,
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Circle-icons-computer.svg/2048px-Circle-icons-computer.svg.png",
      ),
      BuySellCategoryResponseModel(
        id: 2,
        categoryName: "Electronics",
        slug: "electronics",
        status: 1,
        image:
            "https://icons.veryicon.com/png/o/construction-tools/engineering-physics-color-icon/electronics.png",
      ),
      BuySellCategoryResponseModel(
        id: 2,
        categoryName: "Home & Living",
        slug: "electronics",
        status: 1,
        image: "https://cdn-icons-png.flaticon.com/512/1786/1786149.png",
      ),
      BuySellCategoryResponseModel(
        id: 2,
        categoryName: "Vehicles",
        slug: "electronics",
        status: 1,
        image: "https://cdn-icons-png.flaticon.com/512/171/171239.png",
      ),
      BuySellCategoryResponseModel(
        id: 2,
        categoryName: "Education",
        slug: "electronics",
        status: 1,
        image: "https://cdn-icons-png.flaticon.com/512/3557/3557635.png",
      ),
      BuySellCategoryResponseModel(
        id: 2,
        categoryName: "Property",
        slug: "electronics",
        status: 1,
        image:
            "https://icon-library.com/images/property-icon-png/property-icon-png-24.jpg",
      ),
      BuySellCategoryResponseModel(
        id: 2,
        categoryName: "Pets & Animals",
        slug: "electronics",
        status: 1,
        image: "https://cdn-icons-png.flaticon.com/512/2138/2138440.png",
      ),
      BuySellCategoryResponseModel(
        id: 2,
        categoryName: "Fashion's",
        slug: "electronics",
        status: 1,
        image: "https://cdn-icons-png.flaticon.com/512/403/403887.png",
      ),
    ];
  }
}

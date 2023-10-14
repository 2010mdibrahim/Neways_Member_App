// To parse this JSON data, do
//
//     final buySellResponseModel = buySellResponseModelFromJson(jsonString);

import 'dart:convert';

List<BuySellResponseModel> buySellResponseModelFromJson(List data) =>
    List<BuySellResponseModel>.from(
        data.map((x) => BuySellResponseModel.fromJson(x)));

String buySellResponseModelToJson(List<BuySellResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BuySellResponseModel {
  BuySellResponseModel({
    this.id,
    this.title,
    this.location,
    this.slug,
    this.postedDate,
    this.price,
    this.status,
    this.image,
  });

  dynamic id;
  dynamic title;
  dynamic slug;
  dynamic location;
  dynamic postedDate;
  dynamic price;
  dynamic status;
  dynamic image;

  factory BuySellResponseModel.fromJson(Map<String, dynamic> json) =>
      BuySellResponseModel(
        id: json["id"],
        title: json["title"],
        location: json["location"],
        slug: json["slug"],
        postedDate: json["posted_date"],
        price: json["price"],
        status: json["status"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "location": location,
        "slug": slug,
        "posted_date": postedDate,
        "price": price,
        "status": status,
        "image": image,
      };

  getAllBuySellProducts() {
    return [
      BuySellResponseModel(
        id: 1,
        image: "https://i.ytimg.com/vi/F-Cgr2m63os/maxresdefault.jpg",
        price: "9,500",
        title: "Realme C21 . (Used)",
        postedDate: "",
        location: "Dhaka, Mobile Phones",
        slug: "",
      ),
      BuySellResponseModel(
        id: 2,
        image:
            "https://i.bikroy-st.com/samsung-galaxy-s22-ultra-12-256-official-new-for-sale-dhaka/9c3dda31-8cc9-4c8b-b116-ce369202be4a/620/466/fitted.jpg",
        price: "119,990",
        title: "Samsung Galaxy S22 Ultra (12/256) official (New)",
        postedDate: "",
        location: "Farmgate, Dhaka",
        slug: "",
      ),
      BuySellResponseModel(
        id: 3,
        image:
            "https://i.bikroy-st.com/vivo-y53s-full-fresh-used-for-sale-dhaka-3/7563b30c-6859-4e64-8919-12ad1d139bc1/620/466/fitted.jpg",
        price: "11,500",
        title: "Vivo Y53s Full fresh (Used)",
        postedDate: "",
        location: "Uttara, Dhaka",
        slug: "",
      ),
      BuySellResponseModel(
        id: 4,
        image:
            "https://i.bikroy-st.com/tecno-spark-6-air-ntuner-mt-used-for-sale-dhaka-8/89851239-8133-49d0-891f-804177a49b84/620/466/fitted.jpg",
        price: "8,000",
        title: "Tecno Spark 6 Air . (Used)",
        postedDate: "",
        location: "Baridhara, Dhaka",
        slug: "",
      ),
      BuySellResponseModel(
        id: 1,
        image:
            "https://i.bikroy-st.com/oppo-a54-4gb-64gb-without-box-used-for-sale-dhaka-7/f2f33a46-6394-4427-9b7a-8d07869232f7/620/466/fitted.jpg",
        price: "12,500",
        title: "OPPO A54 4GB 64GB WITHOUT BOX (Used)",
        postedDate: "",
        location: "Savar, Dhaka",
        slug: "",
      ),
      BuySellResponseModel(
        id: 1,
        image: "https://i.ytimg.com/vi/F-Cgr2m63os/maxresdefault.jpg",
        price: "9,500",
        title: "Realme C21 . (Used)",
        postedDate: "",
        location: "Dhaka, Mobile Phones",
        slug: "",
      ),
      BuySellResponseModel(
        id: 1,
        image: "https://i.ytimg.com/vi/F-Cgr2m63os/maxresdefault.jpg",
        price: "9,500",
        title: "Realme C21 . (Used)",
        postedDate: "",
        location: "Dhaka, Mobile Phones",
        slug: "",
      ),
    ];
  }
}

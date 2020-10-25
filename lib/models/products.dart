import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.name,
    this.slug,
    this.volume,
    this.pieces,
    this.price,
    this.description,
    this.information,
    this.action,
    this.createdDt,
    this.updatedDt,
    this.images,
  });

  String name;
  String slug;
  String volume;
  bool pieces;
  String price;
  String description;
  String information;
  bool action;
  DateTime createdDt;
  DateTime updatedDt;
  List<Images> images;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        name: json["name"],
        slug: json["slug"],
        volume: json["volume"],
        pieces: json["pieces"],
        price: json["price"],
        description: json["description"],
        information: json["information"],
        action: json["action"],
        createdDt: DateTime.parse(json["created_dt"]),
        updatedDt: DateTime.parse(json["updated_dt"]),
        images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "volume": volume,
        "pieces": pieces,
        "price": price,
        "description": description,
        "information": information,
        "action": action,
        "created_dt": createdDt.toIso8601String(),
        "updated_dt": updatedDt.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Images {
  Images({
    this.file,
  });

  String file;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
      };
}

final List<Products> productList = [
  Products(
    name: "Гречка Гречка Гречка Гречка Гречка Гречка Гречка",
    price: "15000",
  ),
  Products(
    name: "Гарох",
    price: "8000",
  ),
  Products(
    name: "Макарон",
    price: "20000",
  ),
  Products(
    name: "Рис",
    price: "9000",
  ),
];

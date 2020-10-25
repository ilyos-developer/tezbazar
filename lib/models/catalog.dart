import 'dart:convert';

List<Catalog> catalogFromJson(String str) =>
    List<Catalog>.from(json.decode(str).map((x) => Catalog.fromJson(x)));

String catalogToJson(List<Catalog> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Catalog {
  Catalog({
    this.name,
    this.icon,
    this.slug,
    this.children,
    this.getProductsCount,
  });

  String name;
  dynamic icon;
  String slug;
  List<Catalog> children;
  int getProductsCount;

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
        name: json["name"],
        icon: json["icon"],
        slug: json["slug"],
        children: json["children"] == null
            ? null
            : List<Catalog>.from(
                json["children"].map((x) => Catalog.fromJson(x))),
        getProductsCount: json["get_products_count"] == null
            ? null
            : json["get_products_count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
        "slug": slug,
        "children": children == null
            ? null
            : List<dynamic>.from(children.map((x) => x.toJson())),
        "get_products_count":
            getProductsCount == null ? null : getProductsCount,
      };
}

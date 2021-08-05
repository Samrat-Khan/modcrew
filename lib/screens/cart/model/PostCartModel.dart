import 'dart:convert';

class PostCartModel {
  PostCartModel({
    required this.items,
  });

  final List<PostItem> items;

  factory PostCartModel.fromRawJson(String str) =>
      PostCartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostCartModel.fromJson(Map<String, dynamic> json) => PostCartModel(
        items:
            List<PostItem>.from(json["items"].map((x) => PostItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class PostItem {
  PostItem({
    required this.productId,
    required this.sku,
    required this.units,
  });

  final String productId;
  final String sku;
  final int units;

  factory PostItem.fromRawJson(String str) =>
      PostItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostItem.fromJson(Map<String, dynamic> json) => PostItem(
        productId: json["productId"],
        sku: json["sku"],
        units: json["units"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "sku": sku,
        "units": units,
      };
}

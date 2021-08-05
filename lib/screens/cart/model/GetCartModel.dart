import 'dart:convert';

class GetCartModel {
  GetCartModel({
    required this.success,
    required this.data,
  });

  final bool success;
  final GetCartData data;

  factory GetCartModel.fromRawJson(String str) =>
      GetCartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        success: json["success"],
        data: GetCartData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class GetCartData {
  GetCartData({
    required this.id,
    required this.items,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.subTotal,
    required this.v,
  });

  final String id;
  final List<GetCartItem> items;
  final String user;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int subTotal;

  final int v;

  factory GetCartData.fromRawJson(String str) =>
      GetCartData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetCartData.fromJson(Map<String, dynamic> json) => GetCartData(
        id: json["_id"],
        items: List<GetCartItem>.from(
            json["items"].map((x) => GetCartItem.fromJson(x))),
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        subTotal: json["sub_total"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "user": user,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "sub_total": subTotal,
        "__v": v,
      };
}

class GetCartItem {
  GetCartItem({
    required this.id,
    required this.productId,
    required this.sku,
    required this.units,
    required this.name,
    required this.image,
    required this.sellingPrice,
    required this.total,
    required this.hsn,
    required this.tax,
  });

  final String id;
  final String productId;
  final String sku;
  final int units;
  final String name;
  final String image;
  final int sellingPrice;
  final int total;
  final int hsn;
  final int tax;

  factory GetCartItem.fromRawJson(String str) =>
      GetCartItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetCartItem.fromJson(Map<String, dynamic> json) => GetCartItem(
        id: json["_id"],
        productId: json["productId"],
        sku: json["sku"],
        units: json["units"],
        name: json["name"],
        image: json["image"],
        sellingPrice: json["selling_price"],
        total: json["total"],
        hsn: json["hsn"],
        tax: json["tax"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productId": productId,
        "sku": sku,
        "units": units,
        "name": name,
        "image": image,
        "selling_price": sellingPrice,
        "total": total,
        "hsn": hsn,
        "tax": tax,
      };
}

import 'dart:convert';

class WishlistModel {
  WishlistModel({
    required this.success,
    required this.data,
  });

  final bool success;
  final List<Datum> data;

  factory WishlistModel.fromRawJson(String str) =>
      WishlistModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.items,
    required this.id,
    required this.name,
    required this.user,
    required this.totalItems,
  });

  final List<String> items;
  final String id;
  final String name;
  final String user;
  final int totalItems;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        items: List<String>.from(json["items"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        user: json["user"],
        totalItems: json["totalItems"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x)),
        "_id": id,
        "name": name,
        "user": user,
        "totalItems": totalItems,
      };
}

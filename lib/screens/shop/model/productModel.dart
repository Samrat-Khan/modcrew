import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.success,
    required this.data,
  });

  final bool success;
  final ProductModelData data;

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        success: json["success"],
        data: ProductModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class ProductModelData {
  ProductModelData({
    required this.description,
    required this.category,
    required this.isPublished,
    required this.isFeatured,
    required this.variations,
    required this.images,
    required this.reviews,
    required this.id,
    required this.title,
    required this.color,
    required this.mrp,
    required this.sellingPrice,
    required this.tax,
    required this.hsn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final List<String> description;
  final List<String> category;
  final bool isPublished;
  final bool isFeatured;
  final List<Variation> variations;
  final List<String> images;
  final List<Review> reviews;
  final String id;
  final String title;
  final String color;
  final int mrp;
  final int tax;
  final int hsn;
  final int sellingPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory ProductModelData.fromRawJson(String str) =>
      ProductModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModelData.fromJson(Map<String, dynamic> json) =>
      ProductModelData(
        description: List<String>.from(json["description"].map((x) => x)),
        category: List<String>.from(json["category"].map((x) => x)),
        isPublished: json["isPublished"],
        isFeatured: json["isFeatured"],
        variations: List<Variation>.from(
            json["variations"].map((x) => Variation.fromJson(x))),
        images: List<String>.from(json["images"].map((x) => x)),
        reviews: List<Review>.from(json["reviews"].map((x) => x)),
        id: json["_id"] ?? "",
        title: json["title"] ?? "",
        color: json["color"] ?? "",
        mrp: json["mrp"],
        sellingPrice: json['sellingPrice'],
        tax: json["tax"],
        hsn: json["hsn"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "description": List<dynamic>.from(description.map((x) => x)),
        "category": List<dynamic>.from(category.map((x) => x)),
        "isPublished": isPublished,
        "isFeatured": isFeatured,
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x)),
        "reviews": List<Review>.from(reviews.map((x) => x)),
        "_id": id,
        "title": title,
        "color": color,
        "mrp": mrp,
        "sellingPrice": sellingPrice,
        "tax": tax,
        "hsn": hsn,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Variation {
  Variation({
    required this.id,
    required this.size,
    required this.sku,
    required this.stockQuantity,
    required this.user,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String size;
  final String sku;
  final int stockQuantity;
  final String user;
  final String product;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Variation.fromRawJson(String str) =>
      Variation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["_id"],
        size: json["size"],
        sku: json["sku"],
        stockQuantity: json["stockQuantity"],
        user: json["user"],
        product: json["product"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "size": size,
        "sku": sku,
        "stockQuantity": stockQuantity,
        "user": user,
        "product": product,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Review {
  Review({
    required this.id,
    required this.reviewerName,
    required this.reviewerId,
    required this.rating,
    required this.title,
    required this.body,
  });

  final String id;
  final String reviewerName;
  final String reviewerId;
  final int rating;
  final String title;
  final String body;
  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        reviewerName: json["reviewerName"],
        reviewerId: json["reviewerId"],
        rating: json["rating"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "reviewerName": reviewerName,
        "reviewerId": reviewerId,
        "rating": rating,
        "title": title,
        "body": body,
      };
}

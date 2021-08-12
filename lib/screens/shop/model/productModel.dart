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
    required this.images,
    required this.id,
    required this.title,
    required this.color,
    required this.mrp,
    required this.sellingPrice,
    required this.tax,
    required this.hsn,
    required this.avgRating,
    required this.reviews,
    required this.variations,
  });

  final List<String> description;
  final List<String> category;
  final bool isPublished;
  final bool isFeatured;
  final List<String> images;
  final String id;
  final String title;
  final String color;
  final int mrp;
  final int sellingPrice;
  final int tax;
  final int hsn;

  final double avgRating;
  final List<Review> reviews;
  final List<Variation> variations;

  factory ProductModelData.fromRawJson(String str) =>
      ProductModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModelData.fromJson(Map<String, dynamic> json) =>
      ProductModelData(
        description: List<String>.from(json["description"].map((x) => x)),
        category: List<String>.from(json["category"].map((x) => x)),
        isPublished: json["isPublished"],
        isFeatured: json["isFeatured"],
        images: List<String>.from(json["images"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        color: json["color"],
        mrp: json["mrp"],
        sellingPrice: json["sellingPrice"],
        tax: json["tax"],
        hsn: json["hsn"],
        avgRating: json["avgRating"].toDouble(),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        variations: List<Variation>.from(
            json["variations"].map((x) => Variation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "description": List<dynamic>.from(description.map((x) => x)),
        "category": List<dynamic>.from(category.map((x) => x)),
        "isPublished": isPublished,
        "isFeatured": isFeatured,
        "images": List<dynamic>.from(images.map((x) => x)),
        "_id": id,
        "title": title,
        "color": color,
        "mrp": mrp,
        "sellingPrice": sellingPrice,
        "tax": tax,
        "hsn": hsn,
        "avgRating": avgRating,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
      };
}

class Review {
  Review({
    required this.id,
    required this.rating,
    required this.title,
    required this.body,
    required this.product,
    required this.user,
    required this.name,
  });

  final String id;
  final int rating;
  final String title;
  final String body;
  final String product;
  final String user;

  final String name;

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        rating: json["rating"],
        title: json["title"],
        body: json["body"],
        product: json["product"],
        user: json["user"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "rating": rating,
        "title": title,
        "body": body,
        "product": product,
        "user": user,
        "name": name,
      };
}

class Variation {
  Variation({
    required this.id,
    required this.size,
    required this.sku,
    required this.stockQuantity,
    required this.product,
  });

  final String id;
  final String size;
  final String sku;
  final int stockQuantity;
  final String product;

  factory Variation.fromRawJson(String str) =>
      Variation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["_id"],
        size: json["size"],
        sku: json["sku"],
        stockQuantity: json["stockQuantity"],
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "size": size,
        "sku": sku,
        "stockQuantity": stockQuantity,
        "product": product,
      };
}

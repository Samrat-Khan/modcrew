class ProductModel {
  ProductModel({
    required this.description,
    required this.category,
    required this.isPublished,
    required this.id,
    required this.createdAt,
    required this.images,
    required this.title,
    required this.price,
    required this.variations,
    required this.reviews,
    required this.v,
  });

  final List<String> description;
  final List<String> category;
  final List<String> images;
  final bool isPublished;
  final String id;
  final DateTime createdAt;
  final String title;
  final int price;
  final List<Variation> variations;
  final List<Review> reviews;
  final int v;
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        description: List<String>.from(json["description"].map((x) => x)),
        category: List<String>.from(json["category"].map((x) => x)),
        images: List<String>.from(json["images"].map((x) => x)),
        isPublished: json["isPublished"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        title: json["title"],
        price: json["price"],
        variations: List<Variation>.from(
            json["variations"].map((x) => Variation.fromJson(x))),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "description": List<dynamic>.from(description.map((x) => x)),
        "category": List<dynamic>.from(category.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x)),
        "isPublished": isPublished,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "title": title,
        "price": price,
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
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

class Variation {
  Variation({
    required this.id,
    required this.size,
    required this.stockQuantity,
  });

  final String id;
  final String size;
  final int stockQuantity;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["_id"],
        size: json["size"],
        stockQuantity: json["stockQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "size": size,
        "stockQuantity": stockQuantity,
      };
}

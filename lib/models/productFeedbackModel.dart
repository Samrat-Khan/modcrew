import 'dart:convert';

class ProductReviewModel {
  ProductReviewModel({
    required this.id,
    required this.reviewerName,
    required this.reviewerId,
    required this.rating,
    required this.title,
    required this.body,
    required this.v,
  });

  final String id;
  final String reviewerName;
  final String reviewerId;
  final int rating;
  final String title;
  final String body;
  final int v;

  factory ProductReviewModel.fromRawJson(String str) =>
      ProductReviewModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) =>
      ProductReviewModel(
        id: json["_id"],
        reviewerName: json["reviewerName"],
        reviewerId: json["reviewerId"],
        rating: json["rating"],
        title: json["title"],
        body: json["body"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "reviewerName": reviewerName,
        "reviewerId": reviewerId,
        "rating": rating,
        "title": title,
        "body": body,
        "__v": v,
      };
}

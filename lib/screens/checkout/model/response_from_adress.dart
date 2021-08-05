import 'dart:convert';

class ResponseForPlacingOrder {
  ResponseForPlacingOrder({
    required this.id,
  });

  final String id;

  factory ResponseForPlacingOrder.fromRawJson(String str) =>
      ResponseForPlacingOrder.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseForPlacingOrder.fromJson(Map<String, dynamic> json) =>
      ResponseForPlacingOrder(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}

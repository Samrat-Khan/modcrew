import 'dart:convert';

class CheckOutCartModel {
  CheckOutCartModel({
    required this.productId,
    required this.sku,
    required this.units,
  });

  final String productId;
  final String sku;
  final int units;

  factory CheckOutCartModel.fromRawJson(String str) =>
      CheckOutCartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckOutCartModel.fromJson(Map<String, dynamic> json) =>
      CheckOutCartModel(
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

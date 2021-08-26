import 'dart:convert';

class OrderStatusModel {
  OrderStatusModel({
    required this.status,
    required this.paymentMethod,
    required this.id,
    required this.orderItems,
    required this.subTotal,
    required this.orderDate,
    required this.shippingIsBilling,
    required this.orderId,
    required this.user,
    required this.payment,
  });

  final String status;
  final String paymentMethod;
  final String id;
  final List<OrderItemFromHistory> orderItems;
  final int subTotal;
  final DateTime orderDate;
  final bool shippingIsBilling;
  final double orderId;
  final String user;
  final String payment;

  factory OrderStatusModel.fromRawJson(String str) =>
      OrderStatusModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      OrderStatusModel(
        status: json["status"],
        paymentMethod: json["payment_method"],
        id: json["_id"],
        orderItems: List<OrderItemFromHistory>.from(
            json["order_items"].map((x) => OrderItemFromHistory.fromJson(x))),
        subTotal: json["sub_total"],
        orderDate: DateTime.parse(json["order_date"]),
        shippingIsBilling: json["shipping_is_billing"],
        orderId: json["order_id"].toDouble(),
        user: json["user"],
        payment: json["payment"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "payment_method": paymentMethod,
        "_id": id,
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "sub_total": subTotal,
        "order_date": orderDate.toIso8601String(),
        "shipping_is_billing": shippingIsBilling,
        "order_id": orderId,
        "user": user,
        "payment": payment,
      };
}

class OrderItemFromHistory {
  OrderItemFromHistory({
    required this.id,
    required this.sku,
    required this.units,
    required this.name,
    required this.sellingPrice,
    required this.hsn,
    required this.tax,
    required this.image,
  });

  final String id;
  final String sku;
  final int units;
  final String name;
  final int sellingPrice;
  final int hsn;
  final int tax;
  final String image;

  factory OrderItemFromHistory.fromRawJson(String str) =>
      OrderItemFromHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderItemFromHistory.fromJson(Map<String, dynamic> json) =>
      OrderItemFromHistory(
        id: json["_id"],
        sku: json["sku"],
        units: json["units"],
        name: json["name"],
        sellingPrice: json["selling_price"],
        hsn: json["hsn"],
        tax: json["tax"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sku": sku,
        "units": units,
        "name": name,
        "selling_price": sellingPrice,
        "hsn": hsn,
        "tax": tax,
        "image": image,
      };
}

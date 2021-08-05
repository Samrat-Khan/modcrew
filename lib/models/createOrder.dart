import 'dart:convert';

class CreateOrder {
  CreateOrder({
    required this.billingCustomerName,
    required this.billingAddress,
    required this.billingCity,
    required this.billingPincode,
    required this.billingState,
    required this.billingCountry,
    required this.billingEmail,
    required this.billingPhone,
    this.paymentMethod = "prepaid",
  });

  final String billingCustomerName;
  final String billingAddress;
  final String billingCity;
  final String billingPincode;
  final String billingState;
  final String billingCountry;
  final String billingEmail;
  final String billingPhone;
  final String paymentMethod;

  factory CreateOrder.fromRawJson(String str) =>
      CreateOrder.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateOrder.fromJson(Map<String, dynamic> json) => CreateOrder(
        billingCustomerName: json["billing_customer_name"],
        billingAddress: json["billing_address"],
        billingCity: json["billing_city"],
        billingPincode: json["billing_pincode"],
        billingState: json["billing_state"],
        billingCountry: json["billing_country"],
        billingEmail: json["billing_email"],
        billingPhone: json["billing_phone"],
        paymentMethod: json["payment_method"],
      );

  Map<String, dynamic> toJson() => {
        "billing_customer_name": billingCustomerName,
        "billing_address": billingAddress,
        "billing_city": billingCity,
        "billing_pincode": billingPincode,
        "billing_state": billingState,
        "billing_country": billingCountry,
        "billing_email": billingEmail,
        "billing_phone": billingPhone,
        "payment_method": paymentMethod,
      };
}

class CreateOrderResponse {
  CreateOrderResponse({
    required this.success,
    required this.data,
  });

  final bool success;
  final Data data;

  factory CreateOrderResponse.fromRawJson(String str) =>
      CreateOrderResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      CreateOrderResponse(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.billingCustomerName,
    required this.billingAddress,
    required this.billingCity,
    required this.billingPincode,
    required this.billingCountry,
    required this.billingEmail,
    required this.billingPhone,
    required this.paymentMethod,
    required this.user,
    required this.orderItems,
    required this.subTotal,
    required this.orderDate,
    required this.shippingIsBilling,
    required this.orderId,
    required this.v,
  });

  final String id;
  final String billingCustomerName;
  final String billingAddress;
  final String billingCity;
  final int billingPincode;
  final String billingCountry;
  final String billingEmail;
  final String billingPhone;
  final String paymentMethod;
  final String user;
  final List<OrderItem> orderItems;
  final int subTotal;
  final DateTime orderDate;
  final bool shippingIsBilling;
  final double orderId;
  final int v;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        billingCustomerName: json["billing_customer_name"],
        billingAddress: json["billing_address"],
        billingCity: json["billing_city"],
        billingPincode: json["billing_pincode"],
        billingCountry: json["billing_country"],
        billingEmail: json["billing_email"],
        billingPhone: json["billing_phone"],
        paymentMethod: json["payment_method"],
        user: json["user"],
        orderItems: List<OrderItem>.from(
            json["order_items"].map((x) => OrderItem.fromJson(x))),
        subTotal: json["sub_total"],
        orderDate: DateTime.parse(json["order_date"]),
        shippingIsBilling: json["shipping_is_billing"],
        orderId: json["order_id"].toDouble(),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "billing_customer_name": billingCustomerName,
        "billing_address": billingAddress,
        "billing_city": billingCity,
        "billing_pincode": billingPincode,
        "billing_country": billingCountry,
        "billing_email": billingEmail,
        "billing_phone": billingPhone,
        "payment_method": paymentMethod,
        "user": user,
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "sub_total": subTotal,
        "order_date": orderDate.toIso8601String(),
        "shipping_is_billing": shippingIsBilling,
        "order_id": orderId,
        "__v": v,
      };
}

class OrderItem {
  OrderItem({
    required this.id,
    required this.sku,
    required this.units,
    required this.name,
    required this.sellingPrice,
    required this.hsn,
    required this.tax,
  });

  final String id;
  final String sku;
  final int units;
  final String name;
  final int sellingPrice;
  final int hsn;
  final int tax;

  factory OrderItem.fromRawJson(String str) =>
      OrderItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["_id"],
        sku: json["sku"],
        units: json["units"],
        name: json["name"],
        sellingPrice: json["selling_price"],
        hsn: json["hsn"],
        tax: json["tax"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sku": sku,
        "units": units,
        "name": name,
        "selling_price": sellingPrice,
        "hsn": hsn,
        "tax": tax,
      };
}

import 'dart:convert';

class OrderConfirmStatusModel {
  OrderConfirmStatusModel({
    required this.paymentMethod,
    required this.id,
    required this.billingCustomerName,
    required this.billingAddress,
    required this.billingCity,
    required this.billingPincode,
    required this.billingCountry,
    required this.billingEmail,
    required this.billingPhone,
    required this.user,
    required this.orderItems,
    required this.subTotal,
    required this.orderDate,
    required this.shippingIsBilling,
    required this.orderId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.payment,
  });

  final String paymentMethod;
  final String id;
  final String billingCustomerName;
  final String billingAddress;
  final String billingCity;
  final int billingPincode;
  final String billingCountry;
  final String billingEmail;
  final String billingPhone;
  final String user;
  final List<OrderItem> orderItems;
  final int subTotal;
  final DateTime orderDate;
  final bool shippingIsBilling;
  final double orderId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final Payment payment;

  factory OrderConfirmStatusModel.fromRawJson(String str) =>
      OrderConfirmStatusModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderConfirmStatusModel.fromJson(Map<String, dynamic> json) =>
      OrderConfirmStatusModel(
        paymentMethod: json["payment_method"],
        id: json["_id"],
        billingCustomerName: json["billing_customer_name"],
        billingAddress: json["billing_address"],
        billingCity: json["billing_city"],
        billingPincode: json["billing_pincode"],
        billingCountry: json["billing_country"],
        billingEmail: json["billing_email"],
        billingPhone: json["billing_phone"],
        user: json["user"],
        orderItems: List<OrderItem>.from(
            json["order_items"].map((x) => OrderItem.fromJson(x))),
        subTotal: json["sub_total"],
        orderDate: DateTime.parse(json["order_date"]),
        shippingIsBilling: json["shipping_is_billing"],
        orderId: json["order_id"].toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        payment: Payment.fromJson(json["payment"]),
      );

  Map<String, dynamic> toJson() => {
        "payment_method": paymentMethod,
        "_id": id,
        "billing_customer_name": billingCustomerName,
        "billing_address": billingAddress,
        "billing_city": billingCity,
        "billing_pincode": billingPincode,
        "billing_country": billingCountry,
        "billing_email": billingEmail,
        "billing_phone": billingPhone,
        "user": user,
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "sub_total": subTotal,
        "order_date": orderDate.toIso8601String(),
        "shipping_is_billing": shippingIsBilling,
        "order_id": orderId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "payment": payment.toJson(),
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

class Payment {
  Payment({
    required this.notes,
    required this.id,
    required this.paymentId,
    required this.amount,
    required this.amountPaid,
    required this.amountDue,
    required this.currency,
    required this.receipt,
    required this.status,
    required this.attempts,
    required this.paymentCreatedAt,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.paymentPaymentId,
  });

  final List<dynamic> notes;
  final String id;
  final String paymentId;
  final int amount;
  final int amountPaid;
  final int amountDue;
  final String currency;
  final String receipt;
  final String status;
  final int attempts;
  final DateTime paymentCreatedAt;
  final String user;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String paymentPaymentId;

  factory Payment.fromRawJson(String str) => Payment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        notes: List<dynamic>.from(json["notes"].map((x) => x)),
        id: json["_id"],
        paymentId: json["id"],
        amount: json["amount"],
        amountPaid: json["amount_paid"],
        amountDue: json["amount_due"],
        currency: json["currency"],
        receipt: json["receipt"],
        status: json["status"],
        attempts: json["attempts"],
        paymentCreatedAt: DateTime.parse(json["created_at"]),
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        paymentPaymentId: json["payment_id"],
      );

  Map<String, dynamic> toJson() => {
        "notes": List<dynamic>.from(notes.map((x) => x)),
        "_id": id,
        "id": paymentId,
        "amount": amount,
        "amount_paid": amountPaid,
        "amount_due": amountDue,
        "currency": currency,
        "receipt": receipt,
        "status": status,
        "attempts": attempts,
        "created_at": paymentCreatedAt.toIso8601String(),
        "user": user,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "payment_id": paymentPaymentId,
      };
}

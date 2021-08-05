import 'dart:convert';

class CheckOutAddress {
  CheckOutAddress({
    required this.billingCustomerName,
    required this.billingAddress,
    required this.billingCity,
    required this.billingPincode,
    required this.billingState,
    required this.billingCountry,
    required this.billingEmail,
    required this.billingPhone,
    this.paymentMethod = "Prepaid",
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

  factory CheckOutAddress.fromRawJson(String str) =>
      CheckOutAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckOutAddress.fromJson(Map<String, dynamic> json) =>
      CheckOutAddress(
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

class FakeAdress {}

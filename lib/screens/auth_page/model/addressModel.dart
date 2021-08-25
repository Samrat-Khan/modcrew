import 'dart:convert';

class AddressModel {
  AddressModel({
    required this.customerName,
    required this.address,
    required this.city,
    required this.pincode,
    required this.state,
    required this.country,
    required this.phone,
  });

  final String customerName;
  final String address;
  final String city;
  final String pincode;
  final String state;
  final String country;
  final String phone;

  factory AddressModel.fromRawJson(String str) =>
      AddressModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        customerName: json["customer_name"],
        address: json["address"],
        city: json["city"],
        pincode: json["pincode"],
        state: json["state"],
        country: json["country"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "customer_name": customerName,
        "address": address,
        "city": city,
        "pincode": pincode,
        "state": state,
        "country": country,
        "phone": phone,
      };
}

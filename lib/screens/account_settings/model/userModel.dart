// To parse this JSON data, do
//
//     final userAddressModel = userAddressModelFromJson(jsonString);

import 'dart:convert';

class UserDataModel {
  UserDataModel({
    required this.role,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.addressBook,
    required this.age,
    required this.createdAt,
    required this.v,
    required this.phone,
  });

  final String role;
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final List<AddressBook> addressBook;
  final int age;
  final DateTime createdAt;
  final int v;
  final int phone;

  factory UserDataModel.fromRawJson(String str) =>
      UserDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        role: json["role"],
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        addressBook: List<AddressBook>.from(
            json["addressBook"].map((x) => AddressBook.fromJson(x))),
        age: json["age"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "addressBook": List<dynamic>.from(addressBook.map((x) => x.toJson())),
        "age": age,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}

// class AddressBook {
//   AddressBook({
//     required this.name,
//     required this.phone,
//     required this.state,
//     required this.district,
//     required this.city,
//     required this.locality,
//     required this.landmark,
//     required this.pincode,
//     required this.addressType,
//   });

//   final String name;
//   final int phone;
//   final String state;
//   final String district;
//   final String city;
//   final String locality;
//   final String landmark;
//   final int pincode;
//   final String addressType;

//   factory AddressBook.fromRawJson(String str) =>
//       AddressBook.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory AddressBook.fromJson(Map<String, dynamic> json) => AddressBook(
//         name: json["name"],
//         phone: json["phone"],
//         state: json["state"],
//         district: json["district"],
//         city: json["city"],
//         locality: json["locality"],
//         landmark: json["landmark"],
//         pincode: json["pincode"],
//         addressType: json["addressType"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "phone": phone,
//         "state": state,
//         "district": district,
//         "city": city,
//         "locality": locality,
//         "landmark": landmark,
//         "pincode": pincode,
//         "addressType": addressType,
//       };
// }

class AddressBook {
  AddressBook({
    required this.id,
    required this.customerName,
    required this.address,
    required this.city,
    required this.pincode,
    required this.state,
    required this.country,
    required this.phone,
    required this.user,
  });

  final String id;
  final String customerName;
  final String address;
  final String city;
  final String pincode;
  final String state;
  final String country;
  final String phone;
  final String user;

  factory AddressBook.fromRawJson(String str) =>
      AddressBook.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressBook.fromJson(Map<String, dynamic> json) => AddressBook(
        id: json["_id"],
        customerName: json["customer_name"],
        address: json["address"],
        city: json["city"],
        pincode: json["pincode"],
        state: json["state"],
        country: json["country"],
        phone: json["phone"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "customer_name": customerName,
        "address": address,
        "city": city,
        "pincode": pincode,
        "state": state,
        "country": country,
        "phone": phone,
        "user": user,
      };
}

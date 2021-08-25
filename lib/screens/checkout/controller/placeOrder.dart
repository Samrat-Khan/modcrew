import 'dart:convert';
import 'dart:io';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:shopping_page/env/apiRoutes.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/widgets/widgets.dart';

import '../../screens.dart';

class PlaceOrderHttpService {
  final orderIdController = OrderIdController.to;
  final authController = Get.put(AuthController());
  final UploadAdress uploadAdress = UploadAdress();
  uploadCart({required List<CheckOutCartModel> cartItms}) async {
    var jsonBody = {"items": cartItms};
    try {
      var body = jsonEncode(jsonBody);
      await http.post(
        Uri.parse(env_Cart),
        body: body,
        headers: <String, String>{
          HttpHeaders.authorizationHeader:
              "Bearer ${authController.authToken.value}",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    } catch (e) {
      print("Upload Cart $e");
    }
  }

  getAddress() async {
    var res = await http.get(
      Uri.parse(env_uploadAddress),
      headers: <String, String>{
        HttpHeaders.authorizationHeader:
            "Bearer ${authController.authToken.value}",
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    Map data = jsonDecode(res.body);
    return data["data"];
  }

  uploadAddress(
      {required BuildContext context,
      required CountDownController countDownController}) async {
    final userData = authController.userData.value[0];

    List<AddressBook> addresBook = [];
    List data = await getAddress();
    if (data.length != 0) {
      for (int i = 0; i < data.length; i++) {
        addresBook.add(AddressBook.fromJson(data[i]));
      }
    } else {
      confirmMessage(
              context: context,
              message: "Please add your address first",
              ringColor: Colors.redAccent,
              countDownController: countDownController,
              duration: 3)
          .whenComplete(
        () => Navigator.of(context).pushNamed(RouteName.account),
      );
    }
    final mockUserAddress = CheckOutAddress(
      customerName: userData.firstName + " " + userData.lastName,
      address: addresBook[0].address,
      city: addresBook[0].city,
      pincode: addresBook[0].pincode,
      state: addresBook[0].state,
      country: "IND",
      email: userData.email,
      phone: userData.phone.toString(),
    );

    var jsonBody = jsonEncode(mockUserAddress);

    try {
      var res = await http.post(
        Uri.parse(env_order),
        body: jsonBody,
        headers: <String, String>{
          HttpHeaders.authorizationHeader:
              "Bearer ${authController.authToken.value}",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      var jsonResponse = jsonDecode(res.body)["data"];

      String id = jsonResponse["_id"];

      return id;
    } catch (e) {
      print("Error during upload address $e");
    }
  }

  razorPayOrder({required String orderId}) async {
    try {
      var res = await http.post(
        Uri.parse(
          env_razor_pay_order(orderId: orderId),
        ),
        headers: <String, String>{
          HttpHeaders.authorizationHeader:
              "Bearer ${authController.authToken.value}",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      var jsonPay = jsonDecode(res.body)["data"];

      orderIdController.setOrderId(id: jsonPay["receipt"]);
      print(jsonPay);
      return jsonPay["id"];
    } catch (e) {
      print("Error on RazorPay OrderId $e");
    }
  }
}

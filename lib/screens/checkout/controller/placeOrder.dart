import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:shopping_page/env/apiRoutes.dart';

import '../../screens.dart';

class PlaceOrderHttpService {
  final orderIdController = OrderIdController.to;
  final authController = Get.put(AuthController());
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

  uploadAddress() async {
    final userData = authController.userData.value[0];
    final mockUserAddress = CheckOutAddress(
      customerName: userData.firstName + " " + userData.lastName,
      address: "Taltala, Kolkata",
      city: "Kolkata",
      pincode: "700008",
      state: "WB",
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

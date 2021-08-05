import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/env/apiRoutes.dart';
import 'package:shopping_page/screens/checkout/model/address_model.dart';
import 'package:shopping_page/screens/checkout/model/cart_model.dart';

class PlaceOrderHttpService {
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
        billingCustomerName: userData.firstName,
        billingAddress: "Taltala, Kolkata",
        billingCity: "Kolkata",
        billingPincode: "700008",
        billingState: "WB",
        billingCountry: "IND",
        billingEmail: userData.email,
        billingPhone: userData.phone.toString());

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
      print("Error during $e");
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
      print(jsonDecode(res.body));
      var jsonPay = jsonDecode(res.body)["data"];
      print(jsonPay);
      return jsonPay["id"];
    } catch (e) {
      print("Error on RazorPay OrderId $e");
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:shopping_page/env/apiRoutes.dart';

import '../../screens.dart';

class OrderConfirmStatus {
  final authController = AuthController.to;
  final orderIdController = OrderIdController.to;
  getDetails() async {
    try {
      var response = await http.get(
        Uri.parse(
          env_orderStaus(orderId: orderIdController.orderId.value),
        ),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer ${authController.authToken.value}',
        },
      );
      Map<String, dynamic> jsonData = jsonDecode(response.body)["data"];

      return jsonData;
    } catch (e) {
      print("Error duirng confirm Details $e");
    }
  }
}

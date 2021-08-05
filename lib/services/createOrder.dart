import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';
import 'package:shopping_page/models/makeOrder/createOrder.dart';

class CreateOrderService {
  postOrder({required CreateOrder order}) async {
    String baseUrl = env_PaymentApi;

    try {
      var encodeBody = jsonEncode(order);
      var response =
          await http.post(Uri.parse(baseUrl), body: encodeBody, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        print(" Json Data " + "   " + jsonData.toString());
        return jsonData;
      } else {
        print("Stat code  ${response.statusCode}");
        print("${response.body}");
      }
    } on HttpException catch (e) {
      print("${e.message}");
    }
  }
}

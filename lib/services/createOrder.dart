import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';

class CreateOrderService {
  postOrder({required String amount}) async {
    String baseUrl = paymentApi;

    try {
      Map body = {
        "amount": amount,
      };

      var encodeBody = jsonEncode(body);
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

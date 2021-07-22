import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class CreateOrderService {
  postOrder({required String amount}) async {
    String baseUrl = "https://f6fb61d50a72.ngrok.io/payment/order/";

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

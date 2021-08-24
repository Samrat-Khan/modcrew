import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';

class OrderOnTheWay {
  getPlaceOrderDetails({required String token}) async {
    var res = await http.get(
      Uri.parse(
        env_placeOrders,
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    Map<String, dynamic> jsonData = jsonDecode(res.body);
    return jsonData;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';
import 'package:shopping_page/screens/auth_page/controller/authController.dart';

class WishListController {
  final authController = AuthController.to;
  addToWish({required String productId}) async {
    Map body = {
      "name": "default",
      "items": [productId],
    };
    String encodeBody = jsonEncode(body);

    await http.post(
      Uri.parse(env_wishlistCreate),
      body: encodeBody,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader:
            'Bearer ${authController.authToken.value}',
      },
    );
  }

  getWishLists() async {
    var res = await http.get(
      Uri.parse(env_wishlistCreate),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader:
            'Bearer ${authController.authToken.value}',
      },
    );
    Map json = jsonDecode(res.body);
    return json;
  }
}

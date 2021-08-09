import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:shopping_page/env/apiRoutes.dart';
import 'package:http/http.dart' as http;
import '../../screens.dart';

class CartHTTPService {
  final authController = Get.put(AuthController());
  getCartData() async {
    var response = await http.get(Uri.parse(env_Cart), headers: {
      HttpHeaders.authorizationHeader:
          'Bearer ${authController.authToken.value}',
    });
    Map<String, dynamic> jsonData = jsonDecode(response.body)["data"];
    return jsonData;
  }

  postCartData({required List<PostItem> postItemLists}) async {
    try {
      // List<Map> list = [];
      // for (int i = 0; i < postItemLists.length; i++) {
      //   print(postItemLists[i]);
      //   list.add({
      //     "productId": postItemLists[i].productId,
      //     "sku": postItemLists[i].sku,
      //     "units": postItemLists[i].units,
      //   });
      // }
      // var body = jsonEncode(
      //   {
      //     "items": list,
      //   },
      // );
      var json = jsonEncode(postItemLists);
      Map<String, dynamic> body = {
        "items": json,
      };

      var res = await http.post(
        Uri.parse(env_Cart),
        body: body,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer ${authController.authToken.value}',
        },
      );
    } on HttpException catch (e) {
      print(e.message);
    }
  }
}

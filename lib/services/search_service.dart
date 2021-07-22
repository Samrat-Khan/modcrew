import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping_page/services/constData.dart';

class SerachProduct {
  findProduct({required String productName}) async {
    try {
      var response = await http.get(
        Uri.parse(
          SEARCH_PRODUCTS(productName: productName),
        ),
      );
      Map<String, dynamic> jsonBody = jsonDecode(response.body);
      return jsonBody;
    } on HttpException catch (e) {
      print("Error on Serach ${e.message}");
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';

class FetchProductByCategory {
  Future getAllProduct() async {
    String url = baseUrl + "/products";

    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonBody = json.decode(response.body);
    return jsonBody;
  }

  Future getProductsByFilter({
    required String mainCategory,
  }) async {
    String url = baseUrl + "/products";
    Map<String, dynamic> qParams = {
      "category": mainCategory,
    };
    String query = Uri(queryParameters: qParams).query;

    String uri = url + '?' + query;

    var response = await http.get(Uri.parse(uri));
    Map<String, dynamic> jsonBody = json.decode(response.body);
    return jsonBody;
  }
}

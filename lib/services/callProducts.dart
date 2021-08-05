import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';

class GetAllProductsHTTPService {
  Future getAllProduct() async {
    var response = await http.get(Uri.parse(env_GetProducts));

    Map<String, dynamic> jsonBody = json.decode(response.body);
    print(jsonBody);
    return jsonBody;
  }

  Future getSelectedProductes({
    required String qString,
  }) async {
    String url = baseUrl + "/products";
    Map<String, dynamic> qParams = {
      "category": qString,
    };
    String query = Uri(queryParameters: qParams).query;

    String uri = url + '?' + query;
    var response = await http.get(Uri.parse(uri));
    Map<String, dynamic> jsonBody = json.decode(response.body);
    return jsonBody;
  }

  Future getSelectedProductFromFilter({
    required String qString,
    required String filter,
  }) async {
    String url = baseUrl + "/products";
    Map<String, dynamic> qParams = {
      "category": qString + ',' + filter,
    };
    String query = Uri(queryParameters: qParams).query;

    String uri = url + '?' + query;
    var response = await http.get(Uri.parse(uri));
    Map<String, dynamic> jsonBody = json.decode(response.body);
    return jsonBody;
  }

  Future getSelectedProductFromPrcie({
    required bool highToLow,
    required String productMainCategory,
    required String filter,
  }) async {
    String byPrice = highToLow ? "price" : "-price";
    String url = baseUrl + "/products";
    Map<String, dynamic> qParams = {
      "category": filter == "price"
          ? productMainCategory
          : productMainCategory + "," + filter,
      "sort": byPrice,
    };
    String query = Uri(queryParameters: qParams).query;

    String uri = url + '?' + query;
    var response = await http.get(Uri.parse(uri));
    Map<String, dynamic> jsonBody = json.decode(response.body);
    return jsonBody;
  }
}

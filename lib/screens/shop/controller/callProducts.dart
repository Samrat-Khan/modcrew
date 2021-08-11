import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';

class GetProductsHTTPService {
  Future getAllProduct() async {
    String url = baseUrl + "/products";
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonBody = json.decode(response.body);

    return jsonBody;
  }

  Future getProductByType({required String productType}) async {
    String url = baseUrl + "/products";
    Map<String, dynamic> qParams = {
      "category": productType,
    };
    String query = Uri(queryParameters: qParams).query;
    String uri = url + '?' + query;

    var response = await http.get(Uri.parse(uri));
    Map<String, dynamic> jsonBody = json.decode(response.body);

    return jsonBody;
  }

  Future getProductesByCategory({
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

  Future getProductsByCategoryAndSubCategory({
    required String mainCategory,
    required String subCategory,
  }) async {
    String url = baseUrl + "/products";
    Map<String, dynamic> qParams = {
      "category": mainCategory + ',' + subCategory,
    };
    String query = Uri(queryParameters: qParams).query;

    String uri = url + '?' + query;

    var response = await http.get(Uri.parse(uri));
    Map<String, dynamic> jsonBody = json.decode(response.body);
    return jsonBody;
  }

  Future getProductesByCategoryAndPrice({
    required String mainCategory,
    required String byPrice,
  }) async {
    String url = baseUrl + "/products";
    Map<String, dynamic> qParams = {
      "category": mainCategory,
      "sort": byPrice,
    };
    String query = Uri(queryParameters: qParams).query;

    String uri = url + '?' + query;
    var response = await http.get(Uri.parse(uri));
    Map<String, dynamic> jsonBody = json.decode(response.body);
    return jsonBody;
  }

  Future getProductsByPrice(
      {required String byPrice, required String productType}) async {
    String url = baseUrl + "/products";
    Map<String, dynamic> qParams = {
      "category": productType,
      "sort": byPrice,
    };
    String query = Uri(queryParameters: qParams).query;

    String uri = url + '?' + query;
    var response = await http.get(Uri.parse(uri));
    Map<String, dynamic> jsonBody = json.decode(response.body);
    return jsonBody;
  }

  Future getProductsByAllFilter(
      {required String productMainCategory,
      required String productSubCategory,
      required String byPrice}) async {
    String url = baseUrl + "/products";
    Map<String, dynamic> qParams = {
      "category": productMainCategory + "," + productSubCategory,
      "sort": byPrice,
    };
    String query = Uri(queryParameters: qParams).query;

    String uri = url + '?' + query;
    var response = await http.get(Uri.parse(uri));
    Map<String, dynamic> jsonBody = json.decode(response.body);
    return jsonBody;
  }
}

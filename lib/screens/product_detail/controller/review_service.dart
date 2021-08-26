import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';
import 'package:shopping_page/screens/auth_page/controller/authController.dart';

class ReviewHTTPService {
  // getProductReview({required String productId}) async {
  //   try {
  //     var response = await http.get(Uri.parse(GET_POST_REVIEW));
  //     Map<String, dynamic> jsonData = jsonDecode(response.body);
  //     return jsonData;
  //   } on HttpException catch (e) {
  //     print("HTTP Exception on Get Reviews ${e.message}");
  //   }
  // }
  final authController = AuthController.to;
  postProductReview({
    required String userId,
    required String review,
    required int rating,
    required String reviwerName,
    required String title,
    required String productId,
  }) async {
    try {
      Map qBody = {
        // "reviewerName": reviwerName,
        // "reviewerId": userId,
        "rating": rating,
        "title": title,
        "body": review,
      };
      var encodedBody = jsonEncode(qBody);
      var response = await http.post(
        Uri.parse(env_addReview(productId: productId)),
        body: encodedBody,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer ${authController.authToken.value}',
        },
      );
      var jsonBody = jsonDecode(response.body);
      print("data of Review $jsonBody");
      return jsonBody["success"];
    } on HttpException catch (e) {
      print("HTTP Exception on POST Reviews ${e.message}");
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';
import 'package:shopping_page/screens/auth_page/controller/authController.dart';

import '../../screens.dart';

class UploadAddress {
  final authController = AuthController.to;

  uploadAddress({required AddressModel addressModel}) async {
    try {
      var body = {
        {
          "customer_name":
              "${authController.userData.value[0].firstName} ${authController.userData.value[0].lastName}",
          "address": addressModel.address,
          "city": addressModel.city,
          "pincode": addressModel.phone,
          "state": addressModel.state,
          "country": "India",
          "phone": "${authController.userData.value[0].phone}",
        }
      };
      String encodeBody = jsonEncode(body);
      var data = await http.post(
        Uri.parse(env_uploadAddress),
        body: encodeBody,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader:
              'Bearer ${authController.authToken.value}',
        },
      );
      var jsonBody = jsonDecode(data.body);

      return jsonBody;
    } on HttpException catch (e) {
      print("Error duing sign in ${e.message}");
    }
  }
}

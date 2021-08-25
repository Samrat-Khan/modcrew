import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_page/env/apiRoutes.dart';

import '../../screens.dart';

class UploadAdress {
  uploadAddress({required AddressBook addressBook}) async {
    final authController = AuthController.to;
    var body = {
      "customer_name": addressBook.customerName,
      "address": addressBook.address,
      "city": addressBook.city,
      "pincode": addressBook.pincode,
      "state": addressBook.state,
      "country": "India",
      "phone": addressBook.phone,
    };
    String jsonBody = jsonEncode(body);
    await http.post(
      Uri.parse(env_uploadAddress),
      body: jsonBody,
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            'Bearer ${authController.authToken.value}',
      },
    );
  }

  getAddress() async {
    final authController = AuthController.to;
    var res = await http.get(
      Uri.parse(env_uploadAddress),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            'Bearer ${authController.authToken.value}',
      },
    );
    Map data = jsonDecode(res.body);
  }
}

class AddressController extends GetxController {
  static AddressController get to => AddressController.to;
  var addresList = <AddressBook>[].obs;
  // setAddress({required List<Map> jsondata}) {
  //   jsondata.forEach((element) {
  //     addresList.value.add(element);
  //   });
  // }
}

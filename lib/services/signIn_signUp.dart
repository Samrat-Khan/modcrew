import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_page/models/signUp.dart';
import 'package:shopping_page/services/services.dart';
import 'package:shopping_page/widgets/error_dialouge/error_dialouge.dart';

class SignInSignUp {
  Future signUp(
      {required SignUpModel signUpModel, required BuildContext context}) async {
    var body = {
      "firstName": signUpModel.firstName,
      "lastName": signUpModel.lastName,
      "phone": signUpModel.number,
      "email": signUpModel.email,
      "password": signUpModel.password,
      "age": signUpModel.age,
    };
    var encodeBody = jsonEncode(body);

    var token = await http.post(
      Uri.parse(SIGN_UP),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: encodeBody,
    );
    var jsonBody = jsonDecode(token.body);
    AuthKeyStorage.setValue(key: jsonBody["token"]);

    return jsonBody;
  }

  Future signIn({
    required String email,
    required String password,
  }) async {
    try {
      var body = {
        "email": email,
        "password": password,
      };
      var encodeBody = jsonEncode(body);
      var token = await http.post(
        Uri.parse(SIGN_IN),
        body: encodeBody,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var jsonBody = jsonDecode(token.body);
      AuthKeyStorage.setValue(key: jsonBody["token"]);
      return jsonBody;
    } on HttpException catch (e) {
      print("Error duing sign in ${e.message}");
    }
  }

  Future getUserData({required String token}) async {
    try {
      var data = await http.get(Uri.parse(GET_USER), headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });

      var jsonBody = jsonDecode(data.body);
      print(jsonBody);
      return jsonBody;
    } on http.ClientException catch (e) {
      print(e.message);
    }
    // return jsonBody;
  }
}

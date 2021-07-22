import 'package:flutter/material.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/models/models.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/services/localStorage.dart';
import 'package:shopping_page/services/services.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final SignInSignUp signInSignUp = SignInSignUp();
  final authController = AuthController.to;
  @override
  void initState() {
    super.initState();
    AuthKeyStorage.getValue();
    checkingUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  checkingUser() async {
    if (authController.authToken.value == " ") {
      Navigator.of(context).pushNamed(RouteName.home);
    } else {
      Map<String, dynamic> userData =
          await signInSignUp.getUserData(token: authController.authToken.value);
      authController.addUserData(
        userDataModel: UserDataModel.fromJson(userData["data"]),
      );
      Navigator.of(context).pushNamed(RouteName.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

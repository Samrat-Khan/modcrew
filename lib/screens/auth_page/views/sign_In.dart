import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';

import 'package:shopping_page/routes/routeNames.dart';

import 'package:shopping_page/widgets/widgets.dart';

import '../../screens.dart';

class LogInTab extends StatefulWidget {
  const LogInTab({
    Key? key,
    required this.size,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.onTap,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);
  final VoidCallback onTap;
  final Size size;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  _LogInTabState createState() => _LogInTabState();
}

class _LogInTabState extends State<LogInTab> {
  bool isLoading = false;
  final authController = AuthController.to;
  final SignInSignUp signInSignUp = SignInSignUp();
  signInUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      Map<String, dynamic> tokenData = await signInSignUp.signIn(
          email: widget._emailController.text,
          password: widget._passwordController.text);

      if (tokenData["success"] == false ||
          tokenData["error"] == "Invalid credentials") {
        showDialog(
            context: context,
            builder: (context) {
              return InfoDialogForError(
                title: "Error",
                content: "Check you credentials",
              );
            });
      }

      authController.authToken.value = tokenData["token"];
      authController.storeAuthToken(tokenValue: tokenData["token"]);
      // getting userdata
      Map<String, dynamic> userData =
          await signInSignUp.getUserData(token: tokenData["token"]);

      authController.addUserData(
        userDataModel: UserDataModel.fromJson(userData["data"]),
      );
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacementNamed(RouteName.home);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Log In error $e");
    }

    // try {

    // } catch (e) {
    //   setState(() {
    //     isLoading = false;
    //   });
    //   print("Error on adding data ${e}");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Log In",
            style: Styles.kLoginPageTitie,
          ),
          SizedBox(height: 50),
          CustomTextField(
            size: widget.size,
            hintText: "email",
            controller: widget._emailController,
            valiadtor: (value) {},
          ),
          SizedBox(height: 15),
          CustomTextField(
            size: widget.size,
            hintText: "password",
            controller: widget._passwordController,
            valiadtor: (value) {},
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: signInUser,
            child: Text("      LogIn      ", style: Styles.logInPageOtherStyle),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: widget.onTap,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Don't have an account ? ",
                      style: Styles.logInPageOtherStyle),
                  TextSpan(
                    text: "click here",
                    style: Styles.logInPageForgotPassword,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Forgot password",
            style: Styles.logInPageForgotPassword,
          ),
          SizedBox(height: 18),
          // Text("Or Login with", style: Styles.logInPageOtherStyle),
          // SizedBox(height: 18),
          // Row(
          //   children: [
          //     Spacer(),
          //     InkWell(
          //       onTap: () => print("Google"),
          //       child: IconButtonWidget(path: 'assets/icons/google.png'),
          //     ),
          //     SizedBox(width: 10),
          //     InkWell(
          //       onTap: () => print("Facebook"),
          //       child: IconButtonWidget(path: 'assets/icons/facebook.png'),
          //     ),
          //     SizedBox(width: 10),
          //     InkWell(
          //       onTap: () => print("Twitter"),
          //       child: IconButtonWidget(path: 'assets/icons/twitter.png'),
          //     ),
          //     Spacer(),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  final String path;
  const IconButtonWidget({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping_page/const_and_theme/const_and_theme.dart';
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
  final TextEditingController forgotPasswordController =
      TextEditingController();
  final CountDownController countDownController = CountDownController();
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
        widget._passwordController.clear();
        confirmMessage(
          context: context,
          message: "Please Check Your Credentials",
          ringColor: Colors.orange,
          duration: 2,
          countDownController: countDownController,
        );
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
      confirmMessage(
        context: context,
        message: "Something went wrong",
        ringColor: Colors.yellowAccent,
        duration: 3,
        countDownController: countDownController,
      );
    }
  }

  resetPassword() async {
    await signInSignUp
        .forgotPassword(
            token: authController.authToken.value,
            email: forgotPasswordController.text)
        .whenComplete(() {
      confirmMessage(
        context: context,
        message: "An password rest link is send to your email",
        ringColor: Colors.green,
        duration: 5,
        countDownController: countDownController,
      );
    });
  }

  @override
  void dispose() {
    forgotPasswordController.dispose();
    super.dispose();
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
            needPassword: true,
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
          InkWell(
            onTap: () =>
                forgotPasswordPopUp(context: context, size: widget.size),
            child: Text(
              "Forgot password",
              style: Styles.logInPageForgotPassword,
            ),
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }

  forgotPasswordPopUp({required BuildContext context, required Size size}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 7,
            backgroundColor: Colors.white,
            title: Text("Reset Password"),
            content: CustomTextField(
              controller: forgotPasswordController,
              hintText: "Email",
              size: size,
              valiadtor: (val) {},
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(primaryColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff65e866),
                ),
                onPressed: () => resetPassword(),
                child: Text("Rest"),
              ),
            ],
          );
        });
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

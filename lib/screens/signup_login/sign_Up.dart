import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/models/models.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/services/services.dart';
import 'package:shopping_page/widgets/widgets.dart';

class SignUpTab extends StatefulWidget {
  SignUpTab(
      {Key? key,
      required TextEditingController emailController,
      required this.onTap,
      required TextEditingController passwordController,
      required TextEditingController signUpConfirmPasswordController,
      required TextEditingController signUpFirstNameController,
      required TextEditingController signUpPhoneController,
      required TextEditingController signUpLastNameController,
      required this.size})
      : _signUpEmailController = emailController,
        _signUpPasswordController = passwordController,
        _signUpConfirmPasswordController = signUpConfirmPasswordController,
        _signUpFirstNameController = signUpFirstNameController,
        _signUpPhoneController = signUpPhoneController,
        _signUpLastNameController = signUpLastNameController,
        super(key: key);
  final Size size;
  final TextEditingController _signUpEmailController;
  final TextEditingController _signUpPasswordController;
  final TextEditingController _signUpConfirmPasswordController;
  final TextEditingController _signUpFirstNameController;
  final TextEditingController _signUpPhoneController;
  final TextEditingController _signUpLastNameController;
  final VoidCallback onTap;

  @override
  _SignUpTabState createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final _formKey = GlobalKey<FormState>();
  final authController = AuthController.to;
  final SignInSignUp signInSignUp = SignInSignUp();
  bool isLoading = false;

  bool validatePassoword(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(password) ? true : false;
  }

  validateAndSubmit() async {
    setState(() {
      isLoading = true;
    });
    try {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Map<String, dynamic> data = await signInSignUp.signUp(
          context: context,
          signUpModel: SignUpModel(
            age: 18,
            email: widget._signUpEmailController.text,
            firstName: widget._signUpFirstNameController.text,
            lastName: widget._signUpLastNameController.text,
            number: int.parse(widget._signUpPhoneController.text),
            password: widget._signUpConfirmPasswordController.text,
          ),
        );
        if (data["success"] == false ||
            data["error"] == "Duplicate field value entered") {
          showDialog(
              context: context,
              builder: (context) {
                return InfoDialogForError(
                  title: "Error",
                  content: "Check You Data it's alreday exist",
                );
              });
        }
        authController.authToken.value = data["token"];
        Map<String, dynamic> userData =
            await signInSignUp.getUserData(token: data["token"]);
        authController.addUserData(
          userDataModel: UserDataModel.fromJson(userData["data"]),
        );
        setState(() {
          isLoading = false;
        });
        Get.offAllNamed(RouteName.home);
      } else {
        {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Sign Up Error is $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: Colors.black,
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                SizedBox(height: 10),
                Text(
                  "Sign Up",
                  style: Styles.kLoginPageTitie,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Spacer(),
                    CustomTextField(
                      size: widget.size,
                      hintText: "First Name",
                      controller: widget._signUpFirstNameController,
                      widthVal: 0.1,
                      valiadtor: (value) {
                        if (value!.isEmpty ||
                            widget._signUpFirstNameController.text.length <= 3)
                          return "Input cannot empty";
                        else
                          return null;
                      },
                    ),
                    SizedBox(width: 10),
                    CustomTextField(
                      size: widget.size,
                      hintText: "Last Name",
                      controller: widget._signUpLastNameController,
                      widthVal: 0.1,
                      valiadtor: (value) {
                        if (value!.isEmpty ||
                            widget._signUpLastNameController.text.length <= 3)
                          return "Input cannot empty";
                        else
                          return null;
                      },
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 15),
                CustomTextField(
                  size: widget.size,
                  hintText: "email",
                  controller: widget._signUpEmailController,
                  valiadtor: (value) {
                    if (!GetUtils.isEmail(value!))
                      return "Input valid email";
                    else
                      return null;
                  },
                ),
                SizedBox(height: 15),
                CustomTextField(
                  size: widget.size,
                  hintText: "phone number",
                  controller: widget._signUpPhoneController,
                  valiadtor: (value) {
                    if (!GetUtils.isPhoneNumber(value!) ||
                        widget._signUpPhoneController.text.length > 10 ||
                        widget._signUpPhoneController.text.length <= 9)
                      return "Input valid number";
                    else
                      return null;
                  },
                ),
                SizedBox(height: 15),
                CustomTextField(
                  size: widget.size,
                  hintText: "password",
                  controller: widget._signUpPasswordController,
                  valiadtor: (value) {
                    if (!validatePassoword(value!))
                      return "Password must have 1 number\n 1 symbol and cammel case";
                    else
                      return null;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  size: widget.size,
                  hintText: "confirm password",
                  controller: widget._signUpConfirmPasswordController,
                  valiadtor: (value) {
                    if (widget._signUpPasswordController.text !=
                        widget._signUpConfirmPasswordController.text)
                      return "Passoword not match";
                    else
                      return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: validateAndSubmit,
                  child: Text("      Sign Up      ",
                      style: Styles.logInPageOtherStyle),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: widget.onTap,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Alreday have an account? ",
                            style: Styles.logInPageOtherStyle),
                        TextSpan(
                          text: "click here",
                          style: Styles.logInPageForgotPassword,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text("Or Signup with", style: Styles.logInPageOtherStyle),
                SizedBox(height: 18),
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () => print("Google"),
                      child: IconButtonWidget(path: 'assets/icons/google.png'),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () => print("Facebook"),
                      child:
                          IconButtonWidget(path: 'assets/icons/facebook.png'),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () => print("Twitter"),
                      child: IconButtonWidget(path: 'assets/icons/twitter.png'),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

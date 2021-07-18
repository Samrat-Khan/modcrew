import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/models/signUp.dart';
import 'package:shopping_page/models/userModel.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/services/services.dart';
import 'package:shopping_page/widgets/widgets.dart';

class SignUpLogIn extends StatefulWidget {
  final int initIndex;
  const SignUpLogIn({Key? key, this.initIndex = 0}) : super(key: key);

  @override
  _SignUpLogInState createState() => _SignUpLogInState();
}

class _SignUpLogInState extends State<SignUpLogIn>
    with SingleTickerProviderStateMixin {
  TextEditingController _logInEmailController = TextEditingController();
  TextEditingController _logInPasswordController = TextEditingController();
  TextEditingController _signUpEmailController = TextEditingController();
  TextEditingController _signUpPhoneController = TextEditingController();
  TextEditingController _signUpPasswordController = TextEditingController();
  TextEditingController _signUpConfirmPasswordController =
      TextEditingController();
  TextEditingController _signUpFirstNameController = TextEditingController();
  TextEditingController _signUpLastNameController = TextEditingController();

  TabController? _tabController;
  @override
  void initState() {
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.initIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    _logInEmailController.dispose();
    _logInPasswordController.dispose();
    _signUpConfirmPasswordController.dispose();
    _signUpFirstNameController.dispose();
    _signUpPasswordController.dispose();
    _signUpPhoneController.dispose();
    _signUpEmailController.dispose();
    _signUpLastNameController.dispose();
    _tabController!.dispose();
    super.dispose();
  }

  chnageTab(int index) {
    _tabController!.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var desktop = Responsive.isDesktop(context);
    double width = desktop ? 0.3 : 0.8;
    return LayoutTemplate(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: desktop ? size.height : size.height,
            width: size.width * width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  labelStyle: Styles.logInPageTitle,
                  tabs: [
                    Tab(
                      text: "LogIn",
                    ),
                    Tab(
                      text: "SignUp",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      LogInTab(
                        size: size,
                        emailController: _logInEmailController,
                        passwordController: _logInPasswordController,
                        onTap: () => chnageTab(1),
                      ),
                      SignUpTab(
                        size: size,
                        emailController: _signUpEmailController,
                        passwordController: _signUpPasswordController,
                        signUpConfirmPasswordController:
                            _signUpConfirmPasswordController,
                        signUpPhoneController: _signUpPhoneController,
                        signUpFirstNameController: _signUpFirstNameController,
                        signUpLastNameController: _signUpLastNameController,
                        onTap: () => chnageTab(0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

      // getting userdata
      Map<String, dynamic> userData =
          await signInSignUp.getUserData(token: tokenData["token"]);

      authController.addUserData(
        userDataModel: UserDataModel.fromJson(userData["data"]),
      );
      setState(() {
        isLoading = false;
      });
      Get.offAllNamed(RouteName.home);
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
          Text("Or Login with", style: Styles.logInPageOtherStyle),
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
                child: IconButtonWidget(path: 'assets/icons/facebook.png'),
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

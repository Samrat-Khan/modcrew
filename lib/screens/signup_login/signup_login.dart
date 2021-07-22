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

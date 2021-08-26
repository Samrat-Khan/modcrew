import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/screens/account_settings/model/orderOnWayModel.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/loading_no_data/loading.dart';
import 'package:shopping_page/widgets/util/symbol.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final authController = AuthController.to;
  final OrderOnTheWay orderOnTheWay = OrderOnTheWay();

  ordersHistory() async {
    Map<String, dynamic> data = await orderOnTheWay.getPlaceOrderDetails(
        token: authController.authToken.value);

    return data["data"];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: Container(
        height: size.width / 2,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AccountDetailsCard(
                      size: size,
                      nameController: _nameController,
                      numberController: _numberController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController),
                  OrderHistoryCard(
                    size: size,
                    future: ordersHistory(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BorderRadius borderRadius = BorderRadius.circular(10);
}

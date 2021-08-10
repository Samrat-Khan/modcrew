import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: SingleChildScrollView(
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
                OrderHistoryCard(size: size),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              width: size.width,
              height: 200,
              child: Center(
                child: Text("No Orders Found"),
              ),
              // child: ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: 1,
              //   itemBuilder: (_, i) {
              //     return Card(
              //       child: Container(
              //         height: 150,
              //         width: 200,
              //       ),
              //       color: Colors.amberAccent,
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }

  popUpForAddReview() {}
}

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.6,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.transparent,
      ),
    );
  }
}

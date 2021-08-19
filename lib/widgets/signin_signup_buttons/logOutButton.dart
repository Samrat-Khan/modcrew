import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/screens/screens.dart';

import '../widgets.dart';

class ForAuthUser extends StatelessWidget {
  final Widget cartBadge;
  ForAuthUser({Key? key, required this.cartBadge}) : super(key: key);
  final authcConmtroller = AuthController.to;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        cartBadge,
        SizedBox(width: 10),
        InkWell(
          onTap: () {
            Get.toNamed(RouteName.account);
          },
          child: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage("assets/images/u2.png"),
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {
            authcConmtroller.authToken.value = "";
            Get.offAllNamed(RouteName.home);
          },
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.red,
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}

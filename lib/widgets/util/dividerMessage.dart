import 'package:flutter/material.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';

class DividerMessage extends StatelessWidget {
  const DividerMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      // color: Color(infoColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          roundContainer(
            size: size,
            child: messageBox(
                icon: Icons.security, message: " SAFE & SECURE \n CHECKOUT"),
          ),
          VerticalDivider(color: Colors.white),
          roundContainer(
            size: size,
            child: messageBox(
                icon: Icons.refresh,
                message: " NO-HASSLE \n RETURNS & EXCHANGES"),
          ),
          VerticalDivider(color: Colors.white),
          roundContainer(
            size: size,
            child: messageBox(
                icon: Icons.thumb_up_alt_outlined,
                message: " 100% SATISFACTION \n GUARANTEED"),
          ),
        ],
      ),
    );
  }

  Container roundContainer({required Size size, required Widget child}) {
    return Container(
      width: size.width * 0.2,
      height: 140,
      decoration: BoxDecoration(
        color: Color(infoColor),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(child: child),
    );
  }

  RichText messageBox({required IconData icon, required String message}) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(icon, size: 22),
          ),
          TextSpan(
            text: "\n" + message,
            style: Styles.dividerMessageStyles,
          ),
        ],
      ),
    );
  }
}

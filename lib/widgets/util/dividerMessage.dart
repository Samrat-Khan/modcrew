import 'package:flutter/material.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';

class DividerMessage extends StatelessWidget {
  const DividerMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          messageBox(icon: Icons.security, message: " SAFE & SECURE CHECKOUT"),
          VerticalDivider(color: Colors.white),
          messageBox(
              icon: Icons.refresh, message: " NO-HASSLE RETURNS & EXCHANGES"),
          VerticalDivider(color: Colors.white),
          messageBox(
              icon: Icons.sentiment_satisfied,
              message: " 100% SATISFACTION GUARANTEED"),
        ],
      ),
    );
  }

  RichText messageBox({required IconData icon, required String message}) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(icon, size: 22),
          ),
          TextSpan(
            text: message,
            style: Styles.dividerMessageStyles,
          ),
        ],
      ),
    );
  }
}

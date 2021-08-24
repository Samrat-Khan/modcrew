import 'package:flutter/material.dart';
import 'package:shopping_page/screens/layout/layout.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewTemplate(
      sliverChild: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 25,
                ),
                Text("No Netwrok"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';

import 'package:shopping_page/routes/routeNames.dart';
import '../../screens.dart';
import 'fakeUI.dart' if (dart.library.html) 'dart:ui' as ui;

class WebPayment extends StatelessWidget {
  final String orderId;

  WebPayment({
    Key? key,
    required this.orderId,
  }) : super(key: key);
  final cartController = CartController.to;
  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory(
      "rzp-html",
      (int viewId) {
        IFrameElement element = IFrameElement();
        window.onMessage.forEach(
          (element) {
            print('Event Received in callback: ${element.data}');
            if (element.data == 'MODAL_CLOSED') {
              Navigator.pop(context);
            } else if (element.data == 'SUCCESS') {
              cartController.deleteCart();
              Future.delayed(Duration(seconds: 5)).then((value) {});
              Navigator.of(context).pushReplacementNamed(RouteName.orderConfrim,
                  arguments: orderId);
            }
          },
        );

        element.src = 'assets/payments.html?orderId=$orderId';
        element.style.border = 'none';

        return element;
      },
    );
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: HtmlElementView(viewType: 'rzp-html'),
          );
        },
      ),
    );
  }
}

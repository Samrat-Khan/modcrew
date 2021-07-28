import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shopping_page/controller/cartController.dart';

import 'package:shopping_page/routes/routeNames.dart';
import 'fakeUI.dart' if (dart.library.html) 'dart:ui' as ui;

class WebPayment extends StatelessWidget {
  final String name, phone, email, orderId;
  final int price;
  WebPayment({
    Key? key,
    required this.name,
    required this.phone,
    required this.price,
    required this.email,
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
              print(element.data);

              Navigator.pop(context);
            } else if (element.data == 'SUCCESS') {
              print('$element');
              print('${element.data}');
              cartController.deleteCart();
              Navigator.of(context).pushReplacementNamed(RouteName.orderConfrim,
                  arguments: orderId);
            }
          },
        );

        element.src =
            'assets/payments.html?name=$name&price=$price&phone=$phone&email=$email&orderId=$orderId';
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

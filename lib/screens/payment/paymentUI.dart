import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              print('PAYMENT SUCCESSFULL!!!!!!!');
              Get.offAll(RouteName.home);
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

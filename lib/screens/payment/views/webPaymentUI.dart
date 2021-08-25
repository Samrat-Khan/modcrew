// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopping_page/routes/routeNames.dart';
import '../../screens.dart';
import 'fakeUI.dart' if (dart.library.html) 'dart:ui' as ui;

class WebPayment extends StatefulWidget {
  final String orderId;

  WebPayment({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  _WebPaymentState createState() => _WebPaymentState();
}

class _WebPaymentState extends State<WebPayment> {
  final cartController = CartController.to;
  final authController = AuthController.to;
  @override
  void initState() {
    if (widget.orderId.isEmpty) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.home, (route) => false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userData = authController.userData.value[0];
    ui.platformViewRegistry.registerViewFactory(
      "rzp-html",
      (int viewId) {
        IFrameElement element = IFrameElement();
        window.onMessage.forEach(
          (element) {
            print('Event Received in callback: ${element.data}');
            if (element.data == 'MODAL_CLOSED') {
              Get.offAllNamed(RouteName.cart);
            } else if (element.data == "NULL") {
              Get.offAllNamed(RouteName.home);
            } else if (element.data == 'SUCCESS') {
              cartController.deleteCart();
              Future.delayed(Duration(seconds: 5)).then((value) {});
              // Navigator.of(context).pushReplacementNamed(RouteName.orderConfrim,
              //     arguments: widget.orderId);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(RouteName.home, (route) => false);
            }
          },
        );

        element.src =
            'assets/payments.html?orderId=${widget.orderId}&name="${userData.firstName} ${userData.lastName}"&phone=${userData.phone}';
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

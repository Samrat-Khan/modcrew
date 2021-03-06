import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/routes/routeNames.dart';

import '../../screens.dart';

class OrderConfirm extends StatefulWidget {
  final String orderId;
  const OrderConfirm({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  _OrderConfirmState createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  final OrderConfirmStatus status = OrderConfirmStatus();
  OrderConfirmStatusModel? orderStatus;
  bool isLoading = true;
  onCompleteNaviagateToHome() {
    Navigator.pushNamedAndRemoveUntil(context, RouteName.home, (_) => false);
    // Get.offAllNamed(RouteName.home);
  }

  orderGet() async {
    var response = await status.getDetails();
    setState(() {
      orderStatus = OrderConfirmStatusModel.fromJson(response);
      isLoading = false;
    });
  }

  @override
  void initState() {
    orderGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Card(
                child: Container(
                  width: size.width * 0.3,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      orderRow(
                          lable: "Payment Method",
                          value: orderStatus!.paymentMethod),
                      Divider(),
                      orderRow(
                          lable: "Payment Amount",
                          value:
                              (orderStatus!.payment.amount / 100).toString()),
                      Divider(),
                      orderRow(
                          lable: "Order Id",
                          value: orderStatus!.orderId.toString()),
                      Divider(),
                      orderRow(
                          lable: "Transaction Id",
                          value: orderStatus!.payment.paymentId),
                      Divider(),
                      ElevatedButton(
                        onPressed: onCompleteNaviagateToHome,
                        child: Text("Home"),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  orderRow({required String lable, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: SelectableText(
            lable,
            style: GoogleFonts.ubuntu(
              fontSize: 12,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: SelectableText(
            value,
            style: GoogleFonts.ubuntu(
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

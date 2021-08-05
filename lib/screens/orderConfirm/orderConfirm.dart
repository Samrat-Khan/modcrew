import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/screens/orderConfirm/controller/orderConfirmStatus.dart';
import 'package:shopping_page/screens/orderConfirm/model/orderConfirmStatus.dart';
import 'package:shopping_page/widgets/appBar/modCrewLogo.dart';

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

  onCompleteNaviagateToHome() async {
    var response = await status.getDetails();

    orderStatus = OrderConfirmStatusModel.fromJson(response);
    Navigator.of(context).pushReplacementNamed(RouteName.home);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: ModCrewLogo(),
        ),
      ),
      body: Center(
        child: Card(
          child: Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularCountDownTimer(
                      width: 50,
                      height: 50,
                      strokeWidth: 10,
                      duration: 5,
                      fillColor: Colors.green,
                      ringColor: Colors.white,
                      onComplete: onCompleteNaviagateToHome,
                      textStyle: TextStyle(color: Colors.transparent),
                    ),
                    Text(orderStatus!.payment.status,
                        style: GoogleFonts.ubuntu()),
                  ],
                ),
                SizedBox(height: 10),
                orderRow(
                    lable: "Payment Method", value: orderStatus!.paymentMethod),
                Divider(),
                orderRow(
                    lable: "Payment Amount",
                    value: orderStatus!.payment.amount.toString()),
                Divider(),
                orderRow(
                    lable: "Order Id", value: orderStatus!.orderId.toString()),
                Divider(),
                orderRow(
                    lable: "Transaction Id", value: orderStatus!.payment.id),
                Divider(),
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
          child: SelectableText(
            lable,
            style: GoogleFonts.ubuntu(
              fontSize: 12,
            ),
          ),
        ),
        Container(
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

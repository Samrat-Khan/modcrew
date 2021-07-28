import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/routes/routeNames.dart';
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
  onCompleteNaviagateToHome() {
    Navigator.of(context).pushReplacementNamed(RouteName.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: ModCrewLogo(),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularCountDownTimer(
                    width: 150,
                    height: 150,
                    strokeWidth: 10,
                    duration: 5,
                    fillColor: Colors.green,
                    ringColor: Colors.white,
                    onComplete: onCompleteNaviagateToHome,
                    textStyle: TextStyle(color: Colors.transparent),
                  ),
                  Icon(
                    Icons.done_rounded,
                    color: Colors.green,
                    size: 130,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Your Order is Confirmed",
                style: Styles.confrimOrderMessage,
              ),
              Text(
                "OrderId ${widget.orderId}",
                style: Styles.confrimOrderId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

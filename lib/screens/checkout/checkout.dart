import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/models/models.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/services/services.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../../services/placeOrder.dart';

class CheckOut extends StatefulWidget {
  CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final authController = AuthController.to;
  final CreateOrderService createOrderService = CreateOrderService();

  CreateOrderModel? createOrderModel;
  final PlaceOrderHttpService placeOrderHttpService = PlaceOrderHttpService();
  final String orderId = '';
  int selectedButtonIndex = 1;
  final Razorpay razorPay = Razorpay();

  order() async {
    String id = placeOrderHttpService.uploadAddress();
    var razorPayId = placeOrderHttpService.razorPayOrder(orderId: id);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebPayment(
          orderId: razorPayId,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userData = authController.userData.value[0];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SnappingSheet(
        child: Center(
          child: Card(
            elevation: 7,
            child: Container(
              width: size.width * 0.25,
              child: Column(
                children: [
                  rowOfUserInfo(
                      lable: "First Name",
                      value: userData.firstName,
                      size: size),
                  rowOfUserInfo(
                      lable: "Last Name", value: userData.lastName, size: size),
                  rowOfUserInfo(
                      lable: "Email", value: userData.email, size: size),
                  rowOfUserInfo(
                      lable: "Phone",
                      value: userData.phone.toString(),
                      size: size),
                  Divider(),
                  rowOfUserInfo(
                      lable: "Address Line", value: "value", size: size),
                  rowOfUserInfo(lable: "City", value: "value", size: size),
                  rowOfUserInfo(lable: "Pin Code", value: "value", size: size),
                  rowOfUserInfo(lable: "Country", value: "value", size: size),
                  Divider(),
                  rowOfUserInfo(
                      size: size, lable: "Total Amount", value: "value"),
                  Divider(),
                  Container(
                    width: 100,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Place Order"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rowOfUserInfo(
      {required Size size, required String lable, required String value}) {
    return Container(
      width: size.width * 0.19,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: SelectableText(lable),
          ),
          Container(
            child: SelectableText(value),
          ),
        ],
      ),
    );
  }
}

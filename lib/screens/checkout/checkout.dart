import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/controller/cartController.dart';
import 'package:shopping_page/models/models.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/services/services.dart';

class CheckOut extends StatefulWidget {
  final String totaPrice;
  CheckOut({Key? key, required this.totaPrice}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final authController = AuthController.to;
  final CreateOrderService createOrderService = CreateOrderService();
  final cartController = CartController.to;
  CreateOrderModel? createOrderModel;
  final List<String> labelName = ["Cash on Delivery", "Prepaid"];

  final List<String> selectedLabel = ["cod", "prepaid"];
  String labelValue = "prepaid";
  int selectedButtonIndex = 1;
  final Razorpay razorPay = Razorpay();

  order() async {
    UserDataModel model = authController.userData.value[0];
    Map<String, dynamic> response =
        await createOrderService.postOrder(amount: widget.totaPrice);
    createOrderModel = CreateOrderModel.fromJson(response);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebPayment(
          name: "${model.firstName} ${model.lastName}",
          phone: "${model.phone}",
          price: createOrderModel!.amount,
          email: "${model.email}",
          orderId: createOrderModel!.id,
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
    var size = MediaQuery.of(context).size;
    UserDataModel model = authController.userData.value[0];
    return LayoutTemplate(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.3,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          rowForText(
                            lableName: "Total Price",
                            labelValue:
                                cartController.totalPrice.value.toString(),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Details"),
                              Spacer(),
                            ],
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          rowForText(
                            lableName: "Name",
                            labelValue: "${model.firstName}" +
                                " " +
                                "${model.lastName}",
                          ),
                          SizedBox(height: 5),
                          rowForText(
                            lableName: "Phone Number",
                            labelValue: model.phone.toString(),
                          ),
                          SizedBox(height: 5),
                          rowForText(
                            lableName: "Email",
                            labelValue: model.email,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Spacer(),
                              ElevatedButton(
                                onPressed: order,
                                child: Text("Place Order"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  rowForText({required String lableName, required String labelValue}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lableName,
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          labelValue,
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

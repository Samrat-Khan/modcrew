import 'package:flutter/material.dart';

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
    Map<String, dynamic> response =
        await createOrderService.postOrder(amount: widget.totaPrice);
    print(response);
    createOrderModel = CreateOrderModel.fromJson(response);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebPayment(
          name: "Samrat ",
          phone: "7001276983",
          price: createOrderModel!.amount,
          email: "wwesamu@gmail.com",
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

    return LayoutTemplate(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width * 0.3,
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      rowForText(
                        lableName: "Total Price",
                        labelValue:
                            "cartController.totalPrice.value.toString()",
                      ),
                      SizedBox(height: 10),
                      Text("Details"),
                      SizedBox(height: 8),
                      rowForText(
                          lableName: "Name",
                          labelValue:
                              "model.firstName" + " " + "model.lastName"),
                      SizedBox(height: 5),
                      rowForText(
                          lableName: "Phone Number",
                          labelValue: " model.phone.toString()"),
                      SizedBox(height: 5),
                      rowForText(lableName: "Email", labelValue: "model.email"),
                      SizedBox(height: 5),
                      // rowForText(lableName: "Adress", labelValue: model.addressBook[0].addressType),
                      // CustomCheckBoxGroup(
                      //   buttonValuesList: selectedLabel,
                      //   buttonLables: labelName,
                      //   checkBoxButtonValues: (values) {
                      //     print("Values $values");
                      //   },
                      //   defaultSelected: [labelValue],
                      //   enableButtonWrap: true,
                      //   selectedColor: Colors.black,
                      //   unSelectedColor: Colors.white,
                      //   autoWidth: true,
                      //   spacing: 10,
                      // ),
                      // GroupButton(
                      //   isRadio: false,
                      //   spacing: 10,
                      //   onSelected: (index, isSelected) {
                      //     if (index == 0) {
                      //       setState(() {
                      //         selectedButtonIndex = 0;
                      //       });
                      //     } else {
                      //       setState(() {
                      //         selectedButtonIndex = 1;
                      //       });
                      //     }
                      //     print(
                      //         '$index and $selectedButtonIndex button is selected');
                      //   },
                      //   buttons: labelName,
                      //   selectedButtons: [selectedButtonIndex],
                      // ),
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
    );
  }

  rowForText({required String lableName, required String labelValue}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(lableName),
        Text(labelValue),
      ],
    );
  }
}

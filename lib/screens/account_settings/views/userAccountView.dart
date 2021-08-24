import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/screens/account_settings/model/orderOnWayModel.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/loading_no_data/loading.dart';
import 'package:shopping_page/widgets/util/symbol.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final authController = AuthController.to;
  final OrderOnTheWay orderOnTheWay = OrderOnTheWay();

  placeOrders() async {
    Map<String, dynamic> data = await orderOnTheWay.getPlaceOrderDetails(
        token: authController.authToken.value);
    print(data["data"]);
    return data["data"];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AccountDetailsCard(
                    size: size,
                    nameController: _nameController,
                    numberController: _numberController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                elevation: 7,
                child: Container(
                  width: size.width,
                  height: size.height * 0.6,
                  child: FutureBuilder(
                    future: placeOrders(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingSpiner();
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            OrderStatusModel model =
                                OrderStatusModel.fromJson(snapshot.data[i]);
                            var orderItem = model.orderItems[i];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  width: size.width * 0.2,
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        child: Container(
                                          width: size.width,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: borderRadius,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  model.orderItems[i].image),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SelectableText(
                                              orderItem.name,
                                              style: GoogleFonts.ubuntu(),
                                            ),
                                            SelectableText(
                                                "Total Price($rupee): ${orderItem.sellingPrice} x ${orderItem.units} = ${orderItem.sellingPrice * orderItem.units}"),
                                            SelectableText("${model.orderId}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: Text("You have not placed any order"),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BorderRadius borderRadius = BorderRadius.circular(10);
  popUpForAddReview() {}
}

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.6,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.transparent,
      ),
    );
  }
}

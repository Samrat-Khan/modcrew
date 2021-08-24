import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/routes/routeNames.dart';

import 'package:shopping_page/screens/screens.dart';

import 'package:shopping_page/widgets/widgets.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartController = CartController.to;
  final authController = AuthController.to;
  final PlaceOrderHttpService placeOrderHttpService = PlaceOrderHttpService();
  bool isLoadingAssetPage = false;
  @override
  void initState() {
    super.initState();
  }

  uploadCart() async {
    final List<CheckOutCartModel> cartItms = [];
    var data = cartController.cartList.value;
    for (int i = 0; i < data.length; i++) {
      cartItms.add(
        CheckOutCartModel(
            productId: data[i].productId,
            sku: data[i].sku,
            units: data[i].productUnits),
      );
    }
    await placeOrderHttpService.uploadCart(cartItms: cartItms);
    // Navigator.of(context).pushNamed(
    //   RouteName.checkout,
    // );
    order();
  }

  order() async {
    setState(() {
      isLoadingAssetPage = true;
    });
    String id = await placeOrderHttpService.uploadAddress();

    String razorPayId = await placeOrderHttpService.razorPayOrder(orderId: id);

    Navigator.of(context)
        .pushNamed(RouteName.webPayment, arguments: razorPayId);
    setState(() {
      isLoadingAssetPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: isLoadingAssetPage
          ? Center(
              child: LoadingSpiner(),
            )
          : CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: size.width * 0.4,
                            height: size.height * 0.9,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: Obx(
                                      () {
                                        return Text(
                                          "My Cart (${cartController.cartList.value.length})",
                                          style: Styles.contentTitleStyle,
                                        );
                                      },
                                    ),
                                  ),
                                  Divider(),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Obx(
                                        () {
                                          return ListView.separated(
                                            shrinkWrap: true,
                                            separatorBuilder:
                                                (context, index) => Divider(
                                              endIndent: 50,
                                              indent: 50,
                                            ),
                                            itemCount: cartController
                                                .cartList.value.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 15),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 80,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              cartController
                                                                  .cartList
                                                                  .value[index]
                                                                  .image),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 20),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          cartController
                                                              .cartList
                                                              .value[index]
                                                              .name,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Text(
                                                          "$rupee${cartController.cartList.value[index].productPrice} x ${cartController.cartList.value[index].productUnits}",
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    TextButton.icon(
                                                      onPressed: () {
                                                        cartController
                                                            .removieItemFromCart(
                                                                index: index);
                                                      },
                                                      icon: Icon(Icons.delete),
                                                      label: Text(
                                                        "Remove",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Container(
                                    width: double.infinity,
                                    height: 100,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 130,
                                          height: 40,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Navigator.of(context).pushNamed(
                                              //   RouteName.checkout,
                                              // );
                                              if (authController
                                                  .authToken.value.isEmpty) {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return DoAuthDialog();
                                                    });
                                              } else if (cartController
                                                  .cartList.value.isEmpty) {
                                              } else {
                                                uploadCart();
                                              }
                                            },
                                            child: Text(
                                              "Place Order",
                                              style: Styles.subContentStyle,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: size.width * 0.3,
                                height: size.height * 0.1,
                                child: Card(
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Icon(
                                        Icons.security,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      Text(
                                        "100% Purchase Protection",
                                        style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                              Obx(() {
                                return Container(
                                  width: size.width * 0.3,
                                  height: size.height * 0.5,
                                  child: Card(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 50),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Total Items (${cartController.cartList.value.length}) ",
                                                style: Styles.contentTitleStyle,
                                              ),
                                              Spacer(),
                                              Obx(() => Text(
                                                    " ${cartController.subTotal}",
                                                    style:
                                                        Styles.subContentStyle,
                                                  )),
                                            ],
                                          ),
                                          rowOfPurchaseData(
                                            startText: "Discount ",
                                            endValue: 0,
                                          ),
                                          rowOfPurchaseData(
                                            startText: "Delivery Charge ",
                                            endValue: 00,
                                          ),
                                          Divider(),
                                          Obx(
                                            () => rowOfPurchaseData(
                                              startText: "Sub Total ",
                                              endValue: cartController.subTotal
                                                  .toDouble(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      DividerMessage(),
                      SizedBox(height: 50),
                      Footer(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Row rowOfPurchaseData({required String startText, required double endValue}) {
    return Row(
      children: [
        Text(
          "$startText",
          style: Styles.contentTitleStyle,
        ),
        Spacer(),
        Text(
          "$rupee $endValue",
          style: Styles.subContentStyle,
        ),
      ],
    );
  }

  Card iconsButton(IconData icons, VoidCallback functoion) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: functoion,
        icon: Icon(icons),
        color: Colors.black,
      ),
    );
  }
}

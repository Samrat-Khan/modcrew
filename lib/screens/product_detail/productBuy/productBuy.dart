import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shopping_page/const_and_theme/colors.dart';

import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/screens/cart/controller/cartController.dart';
import 'package:shopping_page/models/models.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ContainerForProductBuy extends StatefulWidget {
  final ProductModelData productModelData;

  ContainerForProductBuy({
    Key? key,
    required this.size,
    required this.productModelData,
  }) : super(key: key);

  final Size size;

  @override
  _ContainerForProductBuyState createState() => _ContainerForProductBuyState();
}

class _ContainerForProductBuyState extends State<ContainerForProductBuy> {
  final cartController = CartController.to;
  final authController = AuthController.to;
  Variation? variation;
  int itemCount = 1;
  final List<bool> sizeList = [];
  @override
  void initState() {
    widget.productModelData.variations.forEach(
      (element) {
        sizeList.add(false);
      },
    );
    super.initState();
  }

  void increment() {
    cartController.incrementItemCount();
  }

  void decrement() {
    cartController.deccrementItemCount();
  }

  void addToCart(CartModel itemData) {
    cartController.addItemToCart(cartModel: itemData);
  }

  checkVariationClicked() {
    if (widget.productModelData.variations.isNotEmpty &&
        variation!.id.isNotEmpty) {
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: Responsive.isMobile(context)
                ? EdgeInsets.symmetric(horizontal: 30)
                : EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Product Title
                Text(
                  "${widget.productModelData.title}",
                  style: GoogleFonts.ubuntu(
                      fontSize: 28, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                //Product Price
                Row(
                  children: [
                    Text(
                      "₹ ${widget.productModelData.sellingPrice}",
                      style: GoogleFonts.ubuntu(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "₹ ${widget.productModelData.mrp}",
                      style: GoogleFonts.ubuntu(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                //Product Variations
                widget.productModelData.variations.length == 0
                    ? SizedBox()
                    : Wrap(
                        children: [
                          Container(
                            height: 30,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  widget.productModelData.variations.length,
                              itemBuilder: (_, i) {
                                var data =
                                    widget.productModelData.variations[i];

                                return varitationChip(
                                  label: data.size,
                                  selected: sizeList[i],
                                  function: (val) {
                                    setState(() {
                                      sizeList[i] = !sizeList[i];
                                    });
                                    if (sizeList[i])
                                      variation = Variation(
                                          id: data.id,
                                          size: data.size,
                                          sku: data.sku,
                                          stockQuantity: data.stockQuantity,
                                          user: data.user,
                                          product: data.product,
                                          createdAt: data.createdAt,
                                          updatedAt: data.updatedAt,
                                          v: data.v);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                Divider(
                  color: Colors.white,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prduct Details",
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: widget.productModelData.description.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(
                              Icons.circle,
                              size: 8,
                              color: Colors.black,
                            ),
                            title: Text(
                              widget.productModelData.description[index]
                                  .toString(),
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        onPressed: () {
                          cartController.itemCount.value == 1
                              ? () {}
                              : decrement();
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Responsive.isDesktop(context) ? 15 : 15,
                    ),
                    Container(
                      child: Center(
                        child: Obx(
                          () => Text(
                            "${cartController.itemCount.value}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Responsive.isDesktop(context) ? 15 : 15,
                    ),
                    Card(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        onPressed: increment,
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: Responsive.isMobile(context)
                    ? widget.size.width
                    : widget.size.width / 7,
                padding: Responsive.isMobile(context)
                    ? const EdgeInsets.symmetric(horizontal: 30)
                    : const EdgeInsets.all(0),
                height: 40,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    onSurface: Colors.brown,
                    primary: Color(primaryColor),
                  ),
                  onPressed: () {
                    !checkVariationClicked()
                        ? null
                        : addToCart(
                            CartModel(
                              image: widget.productModelData.images[0],
                              name: widget.productModelData.title,
                              productId: widget.productModelData.id,
                              productUnits: cartController.itemCount.value,
                              productPrice: widget.productModelData.sellingPrice
                                  .toDouble(),
                              sku: variation!.sku,
                              subTotal: (widget.productModelData.sellingPrice *
                                      cartController.itemCount.value)
                                  .toDouble(),
                            ),
                          );
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text("Add to cart"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ChoiceChip varitationChip(
      {required String label,
      required bool selected,
      required Function(bool) function}) {
    return ChoiceChip(
      label: Text(label),
      backgroundColor: Colors.white,
      elevation: 5,
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
      selectedColor: Colors.blueAccent,
      selected: selected,
      onSelected: function,
    );
  }
}

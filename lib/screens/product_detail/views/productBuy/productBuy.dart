import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_button/menu_button.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/routes/routeNames.dart';
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
  final variationController = VariationController.to;
  String sku = 'Select Variation';
  int itemCount = 1;
  final List<String> sizeList = [];

  Text showWaring = Text(
    "Please select variation first",
    style: GoogleFonts.ubuntu(color: Color(primaryColor)),
  );
  @override
  void initState() {
    widget.productModelData.variations.forEach(
      (element) {
        sizeList.add(element.sku);
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
    if (widget.productModelData.variations.isEmpty) {
      variationController.setWaring(value: false);
      return true;
    } else if (sku == "Select Variation") {
      variationController.setWaring(value: true);
      return false;
    } else {
      variationController.setWaring(value: false);
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
                    :
                    // Dropdown Button for Product Variation
                    Row(
                        children: [
                          Container(
                            width: widget.size.width * 0.2,
                            height: 60,
                            child: MenuButton<String>(
                              child: NormalChildButton(sku: sku),
                              items: sizeList,
                              itemBuilder: (String value) => Container(
                                height: 40,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 16),
                                child: Text(value),
                              ),
                              toggledChild: Container(
                                child: NormalChildButton(sku: sku),
                              ),
                              onItemSelected: (String value) {
                                setState(() {
                                  sku = value;
                                });
                                variationController.setWaring(value: false);
                              },
                              onMenuButtonToggle: (bool isToggle) {
                                print(isToggle);
                              },
                            ),
                          ),
                          SizedBox(width: 50),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RouteName.sizeChart);
                            },
                            child: Text("Size Chart"),
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
          Column(
            children: [
              Obx(() => variationController.isNeedWaring.value
                  ? showWaring
                  : SizedBox()),
              SizedBox(height: 5),
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
                                  productPrice: widget
                                      .productModelData.sellingPrice
                                      .toDouble(),
                                  sku: sku,
                                  subTotal:
                                      (widget.productModelData.sellingPrice *
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

class NormalChildButton extends StatelessWidget {
  final String sku;
  const NormalChildButton({Key? key, required this.sku}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 93,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(child: Text(sku, overflow: TextOverflow.ellipsis)),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

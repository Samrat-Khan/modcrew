import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/controller/cartController.dart';
import 'package:shopping_page/models/models.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ContainerForProductBuy extends StatefulWidget {
  final String productName;
  final List<String> productDetail;
  final double productPrice;
  final String productImage;
  ContainerForProductBuy({
    Key? key,
    required this.size,
    required this.productName,
    required this.productPrice,
    required this.productDetail,
    required this.productImage,
  }) : super(key: key);

  final Size size;

  @override
  _ContainerForProductBuyState createState() => _ContainerForProductBuyState();
}

class _ContainerForProductBuyState extends State<ContainerForProductBuy> {
  final cartController = CartController.to;
  final authController = AuthController.to;

  int itemCount = 1;

  @override
  void initState() {
    cartController.updatePrice(item: 1, priceX: widget.productPrice);
    super.initState();
  }

  void increment() {
    cartController.incrementItemCount();

    cartController.updatePrice(
        item: cartController.itemCount.value, priceX: widget.productPrice);
  }

  void decrement() {
    cartController.deccrementItemCount();

    cartController.updatePrice(
        item: cartController.itemCount.value, priceX: widget.productPrice);
  }

  void addToCart(CartModel itemData) {
    cartController.addItemToCart(product: itemData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                widget.productName,
                style: Styles.pdPageProductTitle,
              ),
              SizedBox(height: 5),
              SelectableText(
                "$rupee ${widget.productPrice}/-",
                style: Styles.pdPageProductPrice,
              ),
            ],
          ),
        ],
      ),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Container(
      //       margin: Responsive.isMobile(context)
      //           ? EdgeInsets.symmetric(horizontal: 30)
      //           : EdgeInsets.all(0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             "${widget.productName}",
      //             style: GoogleFonts.ubuntu(
      //                 fontSize: 28, fontWeight: FontWeight.w600),
      //           ),
      //           SizedBox(height: 5),
      //           Obx(
      //             () => Text(
      //               "₹ ${cartController.price.value}",
      //               style: GoogleFonts.ubuntu(
      //                   fontSize: 20, fontWeight: FontWeight.w500),
      //             ),
      //           ),
      //           SizedBox(height: 10),
      //           Text(
      //             "Prduct Details",
      //             style: GoogleFonts.ubuntu(
      //               fontWeight: FontWeight.w900,
      //             ),
      //           ),
      //           SizedBox(height: 10),
      //           Divider(
      //             color: Colors.white,
      //           ),
      //           Container(
      //             width: MediaQuery.of(context).size.width * 0.2,
      //             height: 150,
      //             child: ListView.builder(
      //               shrinkWrap: true,
      //               scrollDirection: Axis.vertical,
      //               itemCount: widget.productDetail.length,
      //               itemBuilder: (context, index) {
      //                 return ListTile(
      //                   leading: Icon(
      //                     Icons.circle,
      //                     size: 8,
      //                     color: Colors.black,
      //                   ),
      //                   title: Text(
      //                     widget.productDetail[index].toString(),
      //                     softWrap: true,
      //                     style: TextStyle(
      //                       fontSize: 12,
      //                       fontWeight: FontWeight.w700,
      //                     ),
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Divider(
      //       indent: 10,
      //       endIndent: 10,
      //     ),
      //     Container(
      //       width: Responsive.isMobile(context)
      //           ? widget.size.width
      //           : widget.size.width * 0.19,
      //       padding: Responsive.isMobile(context)
      //           ? const EdgeInsets.symmetric(horizontal: 30)
      //           : const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      //       child: Row(
      //         children: [
      //           Card(
      //             color: Colors.black,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(5),
      //             ),
      //             child: IconButton(
      //               onPressed: () {
      //                 cartController.itemCount.value == 1 ? () {} : decrement();
      //               },
      //               icon: Icon(
      //                 Icons.remove,
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             width: Responsive.isDesktop(context) ? 15 : 15,
      //           ),
      //           Container(
      //             child: Center(
      //               child: Obx(
      //                 () => Text(
      //                   "${cartController.itemCount.value}",
      //                   style: TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.w800,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             width: Responsive.isDesktop(context) ? 15 : 15,
      //           ),
      //           Card(
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(5),
      //             ),
      //             child: IconButton(
      //               onPressed: increment,
      //               icon: Icon(
      //                 Icons.add,
      //                 color: Colors.black,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: 20),
      //     Container(
      //       width: Responsive.isMobile(context)
      //           ? widget.size.width
      //           : widget.size.width / 7,
      //       padding: Responsive.isMobile(context)
      //           ? const EdgeInsets.symmetric(horizontal: 30)
      //           : const EdgeInsets.all(0),
      //       height: 40,
      //       child: ElevatedButton.icon(
      //         style: ElevatedButton.styleFrom(
      //           onSurface: Colors.brown,
      //         ),
      //         onPressed: () => addToCart(
      //           CartModel(
      //             productId: "hhh;hlhhkb",
      //             productName: widget.productName,
      //             productPrice: widget.productPrice,
      //             productQuentity: cartController.itemCount.value,
      //             productImage: widget.productImage,
      //           ),
      //         ),
      //         icon: Icon(Icons.shopping_cart),
      //         label: Text("Add to cart"),
      //       ),
      //     ),
      //     // productDetailBuilder(context),
      //   ],
      // ),
    );
  }
}

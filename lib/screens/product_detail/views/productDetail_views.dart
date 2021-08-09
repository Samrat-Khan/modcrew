import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/widgets/widgets.dart';

import '../../screens.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModelData productModelData;
  ProductDetailsScreen({Key? key, required this.productModelData})
      : super(key: key);
  static const String route = '/productDetails';
  final authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),

              /// For Mobile View
              Responsive.isMobile(context)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContainerForProductImage(
                          size: size,
                          productImages: productModelData.images,
                        ),
                        ContainerForProductBuy(
                          productModelData: productModelData,
                          size: size,
                        ),
                        // SizedBox(height: 20),
                        // Divider(color: Colors.white),
                        // SizedBox(height: 20),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 30),
                        //   child: Text(
                        //     "Description",
                        //     style: GoogleFonts.ubuntu(
                        //       fontWeight: FontWeight.w800,
                        //       fontSize: 20,
                        //     ),
                        //   ),
                        // ),
                      ],
                    )
                  :

                  ///For Desktop View
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ContainerForProductImage(
                          size: size,
                          productImages: productModelData.images,
                        ),
                        ContainerForProductBuy(
                          size: size,
                          productModelData: productModelData,
                        ),
                      ],
                    ),
              Divider(
                  color: Colors.white, thickness: 1, indent: 30, endIndent: 30),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Customer Reviews",
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              CustomerReviewWidgets(
                review: [],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

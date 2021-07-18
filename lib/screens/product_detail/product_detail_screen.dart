import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/dummyData/dummyData.dart';
import 'package:shopping_page/models/models.dart';
import 'package:shopping_page/widgets/widgets.dart';

import '../screens.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;
  ProductDetailsScreen({Key? key, required this.productModel})
      : super(key: key);
  static const String route = '/productDetails';
  final authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutTemplate(
      body: ListView(
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
                          imagePath: productModel.images[0],
                        ),
                        ContainerForProductBuy(
                          size: size,
                          productName: productModel.title,
                          productDetail: productModel.description,
                          productPrice: productModel.price.toDouble(),
                          productImage: productModel.images[0],
                        ),
                        SizedBox(height: 20),
                        Divider(color: Colors.white),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "Description",
                            style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    )
                  :

                  ///For Desktop View
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ContainerForProductImage(
                          size: size,
                          imagePath: productModel.images[0],
                        ),
                        ContainerForProductBuy(
                          size: size,
                          productName: productModel.title,
                          productDetail: productModel.description,
                          productPrice: productModel.price.toDouble(),
                          productImage: productModel.images[0],
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
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PopupReviewProduct(
                              productId: productModel.id,
                            );
                          },
                        );
                        //     authController.authToken.value == ""
                        // ? null
                        // :
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              CustomerReviewWidgets(
                review: productModel.reviews,
              ),
              SizedBox(height: 30),
              Responsive.isDesktop(context) ? DividerMessage() : SizedBox(),
              Responsive.isDesktop(context) ? SizedBox(height: 30) : SizedBox(),
              Footer(),
            ],
          ),
        ],
      ),
    );
  }
}

class ContainerForProductImage extends StatelessWidget {
  final String imagePath;
  const ContainerForProductImage(
      {Key? key, required this.size, required this.imagePath})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var containerHeight = Responsive.isMobile(context) ? 0.3 : 0.6;
    var containerWidth = 0.6;
    return Container(
      child: Container(
        height: size.height * containerHeight,
        width: Responsive.isMobile(context)
            ? size.width
            : size.width * containerWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

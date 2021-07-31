import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shopping_page/controller/authController.dart';
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
                          productImages: productModel.images,
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
                          productImages: productModel.images,
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
                review: [],
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
  final List<String> productImages;
  ContainerForProductImage(
      {Key? key, required this.size, required this.productImages})
      : super(key: key);

  final Size size;
  final CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var containerHeight = Responsive.isMobile(context) ? 0.3 : 0.6;
    var containerWidth = 0.2;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * containerHeight,
            width: Responsive.isMobile(context)
                ? size.width
                : size.width * containerWidth,
            decoration: BoxDecoration(),
            child: CarouselSlider.builder(
              carouselController: buttonCarouselController,
              itemCount: productImages.length,
              itemBuilder: (_, itemIndex, pageIndex) {
                return imageBox(productImages[itemIndex]);
              },
              options: CarouselOptions(),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: Responsive.isMobile(context)
                ? size.width
                : size.width * containerWidth,
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productImages.length,
              itemBuilder: (_, i) {
                return Card(
                  elevation: 6,
                  child: InkWell(
                    onTap: () {
                      buttonCarouselController.animateToPage(i);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(productImages[i]),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  imageBox(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
      ),
      //       child: PhotoView(
      //   imageProvider: NetworkImage(imageUrl),
      // ),
    );
  }
}

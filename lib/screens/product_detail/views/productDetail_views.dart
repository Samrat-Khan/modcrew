import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/widgets/widgets.dart';

import '../../screens.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModelData productModelData;
  ProductDetailsScreen({Key? key, required this.productModelData})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final authController = AuthController.to;
  final productIdController = ProductIdController.to;
  ProductModelData? modelData;
  bool isLoading = true;
  getProductDetails() async {
    Map<String, dynamic> res = await productIdController.getSingleProduct();
    setState(() {
      modelData = ProductModelData.fromJson(res);
      isLoading = false;
    });
  }

  @override
  void initState() {
    getProductDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: isLoading
          ? Container(
              height: size.width / 2,
              child: Center(
                child: LoadingSpiner(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  /// For Mobile View
                  Responsive.isMobile(context)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ContainerForProductImage(
                              size: size,
                              productImages: widget.productModelData.images,
                            ),
                            ContainerForProductBuy(
                              productModelData: modelData!,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ContainerForProductImage(
                              size: size,
                              productImages: modelData!.images,
                            ),
                            ContainerForProductBuy(
                              size: size,
                              productModelData: modelData!,
                            ),
                          ],
                        ),
                  Divider(
                      color: Colors.white,
                      thickness: 1,
                      indent: 30,
                      endIndent: 30),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
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
            ),
    );
  }
}

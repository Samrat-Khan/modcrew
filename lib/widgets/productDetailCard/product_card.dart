import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/models/models.dart';
import 'package:shopping_page/screens/product_detail/product_detail_screen.dart';
import 'package:shopping_page/widgets/util/responsive.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  const ProductCard({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var saleTextContainer = Responsive.isDesktop(context) ? 0.05 : 0.1;
    var totalStockTextContainer = Responsive.isDesktop(context) ? 0.07 : 0.25;
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              productModel: productModel,
            ),
          ),
        );
      },
      child: Container(
        width: size.width * 0.2,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(productModel.images[0]),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productModel.title,
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      children: [
                        Text(
                          "$rupee ${productModel.price}",
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    // Text(
                    //   "${data.totalStock} Entries",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.w500, color: Colors.black),
                    // ),
                  ],
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//         decoration: BoxDecoration(
//           color: Colors.white38,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(data.imagePath), fit: BoxFit.contain),
//               ),
//             ),
//             data.isSale
//                 ? Positioned(
//                     left: 5,
//                     top: 5,
//                     child: Container(
//                       height: 15,
//                       width:
//                           MediaQuery.of(context).size.width * saleTextContainer,
//                       decoration: BoxDecoration(
//                         color: Color(0xff48a259),
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "${data.discount}% off",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ),
//                   )
//                 : SizedBox(),
//             Positioned(
//               bottom: 10,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.black54.withOpacity(0.2),
//                 ),
//                 child: DefaultTextStyle(
//                   style: Styles.kProductCardTextStyle,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(data.name),
//                       SizedBox(height: 5),

//                       ///Responsive Tarneri operator
//                       !Responsive.isDesktop(context)
//                           ?

//                           /// This is Mobile version
//                           Column(
//                               children: [
//                                 Text("\$${data.price}"),
//                                 SizedBox(height: 8),
//                                 Container(
//                                   width: MediaQuery.of(context).size.width *
//                                       totalStockTextContainer,
//                                   padding: EdgeInsets.symmetric(vertical: 1.5),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff6f68fd),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "${data.totalStock} Entries",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           color: Colors.black),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                           :

//                           /// This is Dekstop Version
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Text("\$${data.price}"),
//                                 SizedBox(width: 5),
//                                 Container(
//                                   width: MediaQuery.of(context).size.width *
//                                       totalStockTextContainer,
//                                   padding: EdgeInsets.symmetric(vertical: 1.5),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xff6f68fd),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "${data.totalStock} Entries",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           color: Colors.black),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),

//                       ///End Tarneri operator
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )
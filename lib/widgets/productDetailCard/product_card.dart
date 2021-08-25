import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ProductCard extends StatefulWidget {
  final ProductModelData productModelData;
  ProductCard({Key? key, required this.productModelData}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  WishListController wishListController = WishListController();
  ProductIdController productIdController = ProductIdController.to;
  final Color badReview = Color(0xffff7769);

  final Color avgReview = Color(0xfffec765);

  final Color goodReview = Color(0xff8dbb60);
  final favColor = Colors.red;
  Color reviewColor = Color(starColor);

  detReviewColor({required double value}) {
    if (value > 0 && value <= 2) {
      setState(() {
        reviewColor = badReview;
      });
    } else if (value > 2 && value < 3) {
      setState(() {
        reviewColor = avgReview;
      });
    } else if (value > 3 && value <= 5) {
      setState(() {
        reviewColor = goodReview;
      });
    }
  }

  detProductIsFav() {}
  @override
  void initState() {
    detReviewColor(value: widget.productModelData.avgRating);
    detProductIsFav();
    super.initState();
  }

  addToWishList({required String productId}) async {
    await wishListController.addToWish(productId: productId);
    await wishListController.getWishLists();
  }

  @override
  Widget build(BuildContext context) {
    var saleTextContainer = Responsive.isDesktop(context) ? 0.05 : 0.1;
    var totalStockTextContainer = Responsive.isDesktop(context) ? 0.07 : 0.25;
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        productIdController.setProductId(id: widget.productModelData.id);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              productModelData: widget.productModelData,
            ),
          ),
        );
      },
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: size.width * 0.2,
          height: size.height * 0.41,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.productModelData.images[0]),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productModelData.title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      priceAndSellingCount(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget starAndFav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.star_rate,
                  color: reviewColor,
                ),
              ),
              TextSpan(
                text: widget.productModelData.avgRating.toString(),
                style: GoogleFonts.ubuntu(
                  color: reviewColor,
                ),
              ),
            ],
          ),
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.favorite_outline,
        //     color: Colors.black,
        //   ),
        // ),
      ],
    );
  }

  Widget priceAndSellingCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "$rupee ${widget.productModelData.sellingPrice}/-",
            ),
            TextSpan(text: "   "),
            TextSpan(
              text: "$rupee ${widget.productModelData.mrp}/-",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ]),
        ),
        starAndFav(),
        // SizedBox(height: 10),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CircleAvatar(
        //       radius: 12,
        //       backgroundColor: Color(bgRedColor),
        //       child: Text(
        //         "80",
        //         style: TextStyle(color: Colors.white, fontSize: 11),
        //       ),
        //     ),
        //     Text(
        //       "Sold",
        //       style: TextStyle(
        //         color: Color(bgRedColor),
        //       ),
        //     )
        //   ],
        // ),
      ],
    );
  }
}

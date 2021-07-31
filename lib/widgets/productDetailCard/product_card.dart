import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
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
      child: Card(
        elevation: 7,
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
              children: [
                Container(
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(productModel.images[0]),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      starAndFav(),
                      SizedBox(height: 2),
                      Text(
                        "Somthing Prodcut Name",
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
                  color: Color(starColor),
                ),
              ),
              TextSpan(text: "4.5"),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_outline,
            color: Colors.black,
          ),
        ),
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
              text: "$rupee 800/-",
            ),
            TextSpan(text: "   "),
            TextSpan(
              text: "$rupee 500/-",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ]),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Color(bgRedColor),
              child: Text(
                "80",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
            Text(
              "Sold",
              style: TextStyle(
                color: Color(bgRedColor),
              ),
            )
          ],
        ),
      ],
    );
  }
}

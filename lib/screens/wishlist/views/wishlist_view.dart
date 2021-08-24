import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_page/env/apiRoutes.dart';
import 'package:shopping_page/screens/layout/layout.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/loading_no_data/loading.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_page/widgets/productDetailCard/product_card.dart';
import 'package:shopping_page/widgets/snapShotGridBuilder/snapShotGridBuilder.dart';
import 'package:shopping_page/widgets/util/responsive.dart';

class WishListView extends StatefulWidget {
  const WishListView({Key? key}) : super(key: key);

  @override
  _WishListViewState createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  WishListController wishListController = WishListController();

  List<ProductModelData> productModel = [];
  getSingleProduct({required String id}) async {
    var res = await http.get(
      Uri.parse(
        env_singleProduct(id: id),
      ),
    );
    Map<String, dynamic> jsonData = jsonDecode(res.body)["data"];

    return jsonData;
  }

  wishList() async {
    Map data = await wishListController.getWishLists();

    for (int i = 0; i < data["data"].length; i++) {
      productModel.add(
        ProductModelData.fromJson(
          await getSingleProduct(id: data["data"][i]["items"][i]),
        ),
      );
    }

    return (productModel);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var isDesktop = Responsive.isDesktop(context);
    return NewTemplate(
      sliverChild: Container(
        height: size.width / 2,
        child: FutureBuilder(
          future: wishList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingSpiner(),
              );
            }
            if (snapshot.hasData) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isDesktop ? 6 : 2,
                    childAspectRatio: isDesktop ? (0.7 / 0.8) : (3.5 / 4),
                  ),
                  itemBuilder: (context, i) {
                    ProductModelData data = snapshot.data[i];
                    return ProductCard(productModelData: data);
                  },
                ),
              );
            } else {
              return Center(
                child: Text("Empty Wishlist.."),
              );
            }
          },
        ),
      ),
    );
  }
}

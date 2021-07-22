import 'package:flutter/material.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/services/search_service.dart';
import 'package:shopping_page/widgets/widgets.dart';

class SearchPage extends StatelessWidget {
  final String productName;
  SearchPage({Key? key, this.productName = "t-shirt"}) : super(key: key);
  getSerachProduct() async {
    Map<String, dynamic> jsonData =
        await searchProduct.findProduct(productName: productName);
    print(jsonData);
    return jsonData["data"];
  }

  final SerachProduct searchProduct = SerachProduct();
  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      body: Container(
        child: ProductFutureBuilder(
          future: getSerachProduct(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_page/screens/screens.dart';

import 'package:shopping_page/widgets/widgets.dart';

class SearchPage extends StatefulWidget {
  final String productName;
  SearchPage({Key? key, required this.productName}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SerachProduct searchProduct = SerachProduct();
  getSerachProduct() async {
    print(widget.productName);
    Map<String, dynamic> jsonData =
        await searchProduct.findProduct(productName: widget.productName);
    return jsonData["data"];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Container(
          height: size.width / 2,
          child: ProductFutureBuilder(
            future: getSerachProduct(),
          ),
        ),
      ),
    );
  }
}

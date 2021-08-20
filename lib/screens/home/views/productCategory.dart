import 'package:flutter/material.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ProductByCategoryScreen extends StatelessWidget {
  final Future<dynamic> future;
  const ProductByCategoryScreen({
    Key? key,
    required this.future,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ProductFutureBuilder(
        future: future,
      ),
    );
  }
}

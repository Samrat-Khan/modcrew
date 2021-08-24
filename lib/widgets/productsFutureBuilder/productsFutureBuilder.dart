import 'package:flutter/material.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ProductFutureBuilder extends StatelessWidget {
  const ProductFutureBuilder({Key? key, required this.future})
      : super(key: key);
  final Future<dynamic> future;

  @override
  Widget build(BuildContext context) {
    var isDesktop = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: size.width / 2,
            child: Center(
              child: LoadingSpiner(),
            ),
          );
        }
        if (!snapshot.hasData || snapshot.hasError) {
          return NoData(noDataType: "product");
        }
        if (snapshot.hasData) {
          return SnapshotGridBuilder(
            isDesktop: isDesktop,
            snapshot: snapshot,
          );
        }
        return Center(
          child: LoadingSpiner(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ProductFutureBuilder extends StatelessWidget {
  const ProductFutureBuilder({Key? key, required this.future})
      : super(key: key);
  final Future<dynamic> future;

  @override
  Widget build(BuildContext context) {
    var isDesktop = Responsive.isDesktop(context);
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingSpiner();
        }
        if (!snapshot.hasData || snapshot.hasError)
          return NoData(noDataType: "product");
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

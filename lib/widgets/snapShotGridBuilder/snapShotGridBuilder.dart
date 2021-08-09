import 'package:flutter/material.dart';
import 'package:shopping_page/widgets/widgets.dart';

class SnapshotGridBuilder extends StatelessWidget {
  const SnapshotGridBuilder({
    Key? key,
    required this.isDesktop,
    required this.snapshot,
  }) : super(key: key);

  final bool isDesktop;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      itemCount: snapshot.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 6 : 2,
        // crossAxisSpacing: 8,
        // mainAxisSpacing: 8,
        childAspectRatio: isDesktop ? (0.7 / 0.8) : (3.5 / 4),
      ),
      itemBuilder: (
        context,
        index,
      ) {
        ProductModelData model =
            ProductModelData.fromJson(snapshot.data[index]);

        ProductModelData data = ProductModelData(
          description: model.description,
          category: model.category,
          isPublished: model.isPublished,
          isFeatured: model.isFeatured,
          variations: model.variations,
          images: model.images,
          reviews: model.reviews,
          id: model.id,
          title: model.title,
          color: model.color,
          mrp: model.mrp,
          sellingPrice: model.sellingPrice,
          tax: model.tax,
          hsn: model.hsn,
          avgRating: model.avgRating,
          user: '',
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: ProductCard(
            productModelData: data,
          ),
        );
      },
    );
  }
}

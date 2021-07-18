import 'package:flutter/material.dart';
import 'package:shopping_page/models/models.dart';
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
        ProductModel model = ProductModel.fromJson(snapshot.data[index]);

        ProductModel data = ProductModel(
          description: model.description,
          category: model.category,
          isPublished: model.isPublished,
          id: model.id,
          createdAt: model.createdAt,
          title: model.title,
          price: model.price,
          variations: model.variations,
          reviews: model.reviews,
          v: model.v,
          images: model.images,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: ProductCard(
            productModel: data,
          ),
        );
      },
    );
  }
}

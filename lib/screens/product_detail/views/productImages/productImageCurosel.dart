import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ContainerForProductImage extends StatelessWidget {
  final List<String> productImages;
  ContainerForProductImage(
      {Key? key, required this.size, required this.productImages})
      : super(key: key);

  final Size size;
  final CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var containerHeight = Responsive.isMobile(context) ? 0.3 : 0.6;
    var containerWidth = 0.2;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * containerHeight,
            width: Responsive.isMobile(context)
                ? size.width
                : size.width * containerWidth,
            decoration: BoxDecoration(),
            child: CarouselSlider.builder(
              carouselController: buttonCarouselController,
              itemCount: productImages.length,
              itemBuilder: (_, itemIndex, pageIndex) {
                return Container(
                  width: size.width * 0.19,
                  height: size.height * 0.18,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(productImages[itemIndex]),
                    ),
                  ),
                  //       child: PhotoView(
                  //   imageProvider: NetworkImage(productImages[itemIndex]),
                  // ),
                );
              },
              options: CarouselOptions(),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: Responsive.isMobile(context)
                ? size.width
                : size.width * containerWidth,
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productImages.length,
              itemBuilder: (_, i) {
                return Card(
                  elevation: 6,
                  child: InkWell(
                    onTap: () {
                      buttonCarouselController.animateToPage(i);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(productImages[i]),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

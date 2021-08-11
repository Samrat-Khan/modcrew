import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopping_page/screens/layout/layout.dart';
import 'package:shopping_page/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetProductsHTTPService httpService = GetProductsHTTPService();
  List<Color> colors = [
    Colors.pink,
    Colors.brown,
    Colors.yellow,
  ];
  getAllProduct() async {
    Map<String, dynamic> data = await httpService.getAllProduct();
    return data["data"];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: CarouselSlider.builder(
                itemCount: colors.length,
                itemBuilder: (context, itemIndex, pageIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: colors[itemIndex],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: size.width * 0.25,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: size.width,
                child: AnimationLimiter(
                  child: ProductFutureBuilder(future: getAllProduct()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

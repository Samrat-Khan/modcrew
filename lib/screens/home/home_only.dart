import 'package:banner_carousel/banner_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/screens/layout/layout.dart';
import 'package:shopping_page/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetProductsHTTPService httpService = GetProductsHTTPService();
  List<String> colors = [
    "https://cdn.shopify.com/s/files/1/0330/1977/files/desktop-bonus-launch-week_2000x768.jpg?v=1627365312",
    "https://cdn.shopify.com/s/files/1/0330/1977/files/desktop-slider_cd1f89aa-f247-41fc-800e-e77066256457_2000x768.jpg?v=1627011360",
  ];
  List<BannerModel> listBanners = [
    BannerModel(
        id: "1",
        imagePath:
            "https://cdn.shopify.com/s/files/1/0330/1977/files/desktop-bonus-launch-week_2000x768.jpg?v=1627365312"),
    BannerModel(
        id: "2",
        imagePath:
            "https://cdn.shopify.com/s/files/1/0330/1977/files/desktop-slider_cd1f89aa-f247-41fc-800e-e77066256457_2000x768.jpg?v=1627011360"),
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
              child: Container(
                width: size.width,
                child: BannerCarousel.fullScreen(
                  banners: listBanners,
                  height: 350,
                  activeColor: Color(infoColor),
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

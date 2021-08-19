import 'package:banner_carousel/banner_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/screens/layout/layout.dart';
import 'package:shopping_page/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  GetProductsHTTPService httpService = GetProductsHTTPService();
  TabController? tabController;
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
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
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
                  activeColor: Color(primaryColor),
                  indicatorBottom: false,
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 150,
              child: Row(
                children: [
                  Container(
                    width: size.width / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2017/12/28/15/06/background-3045402_960_720.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2019/04/21/21/29/pattern-4145023_960_720.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: TabBar(
                      isScrollable: true,
                      controller: tabController,
                      indicatorColor: Color(primaryColor),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Color(primaryColor),
                      labelStyle: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w700,
                      ),
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      unselectedLabelStyle: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w400,
                      ),
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: "New Arrivals",
                        ),
                        Tab(
                          text: "Feature Products",
                        ),
                        Tab(
                          text: "Best Selling",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: size.width,
              height: size.height,
              child: TabBarView(
                controller: tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Container(
                      width: size.width,
                      child: AnimationLimiter(
                        child: ProductFutureBuilder(future: getAllProduct()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Container(
                      width: size.width,
                      child: AnimationLimiter(
                        child: ProductFutureBuilder(future: getAllProduct()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
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
          ],
        ),
      ),
    );
  }
}

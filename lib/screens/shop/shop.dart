import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutTemplate(
      body: body(size: size),
    );
  }

  Widget body({required Size size}) {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            decoration: new BoxDecoration(color: Colors.white),
            child: new TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w700,
              ),
              isScrollable: Responsive.isDesktop(context) ? false : true,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Customtheme.lightTheme.scaffoldBackgroundColor,
              ),
              tabs: [
                Tab(
                  text: "Men",
                ),
                Tab(
                  text: "Women",
                ),
                Tab(
                  text: "Accessories",
                ),
                Tab(
                  text: "Collectible",
                ),
                Tab(
                  text: "Stationary",
                ),
              ],
            ),
          ),
          new Container(
            height: size.height * 2,
            child: new TabBarView(
              controller: _tabController,
              children: <Widget>[
                MensCategory(),
                WomensCategory(),
                AccessoriesCategory(),
                CollectibleCategory(),
                StationaryCategory(),
              ],
            ),
          ),
          DividerMessage(),
          SizedBox(height: 20),
          Footer(),
        ],
      ),
    );
  }
}

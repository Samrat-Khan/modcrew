import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ShopScreen extends StatefulWidget {
  final int pageIndex;
  const ShopScreen({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  GetProductsHTTPService httpService = GetProductsHTTPService();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.pageIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return NewTemplate(
      sliverChild: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: size.width,
              height: 40,
              color: Color(primaryColor),
              child: TabBar(
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
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    text: "Fashion",
                  ),
                  Tab(
                    text: "Collectibles",
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              color: Colors.amber,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  FashionCategory(),
                  CollectibleCategory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

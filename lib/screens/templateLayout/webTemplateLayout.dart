import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/const_and_theme/theme.dart';

import 'package:shopping_page/dummyData/cartData.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

class TemplateLayout extends StatefulWidget {
  final int initTabView;
  const TemplateLayout({Key? key, this.initTabView = 0}) : super(key: key);

  @override
  _TemplateLayoutState createState() => _TemplateLayoutState();
}

class _TemplateLayoutState extends State<TemplateLayout>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);

    super.initState();
    tabController!.animateTo(widget.initTabView);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                floating: false,
                snap: false,
                forceElevated: innerBoxIsScrolled,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                title: ModCrewLogo(),
                elevation: 3,
                actions: [
                  Badge(
                    badgeContent: Text(
                      "${cartData.length}",
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    child: IconButton(
                      hoverColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/cart');
                      },
                      icon: Icon(Icons.shopping_cart_outlined),
                    ),
                    badgeColor: Customtheme.lightTheme.scaffoldBackgroundColor,
                    position: BadgePosition(
                      bottom: 30,
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    hoverColor: Colors.white,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage("assets/images/u3.png"),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  labelStyle: Styles.tabTextStyle,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(
                      text: "Home",
                    ),
                    Tab(
                      text: "Car Accessories",
                    ),
                    Tab(
                      text: "Fashion",
                    ),
                    Tab(
                      text: "Accessories",
                    ),
                    Tab(
                      text: "Account",
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [],
          ),
        ),
      ),
    );
  }

  TextButton textButton(
      {required VoidCallback onPressed, required String label}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: Styles.kNavigationTextStyle(4),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

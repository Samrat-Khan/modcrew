import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/controller/cartController.dart';
import 'package:shopping_page/controller/navChanagingController.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/widgets/widgets.dart';

class LayoutTemplate extends StatefulWidget {
  final Widget body;
  const LayoutTemplate({Key? key, required this.body}) : super(key: key);

  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  TextEditingController _controller = TextEditingController();
  int initIndex = 0;
  final cartController = CartController.to;
  final authController = AuthController.to;
  final navObserver = NavChangeController.to;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  chnageIndex(int index) {
    navObserver.setIndex(currentIndex: index);
  }

  bool checkRouteName(String routeName) {
    if (ModalRoute.of(context)!.settings.name == routeName) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(appBarAndFooterBGColor),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: SearchBar(controller: _controller),
          ),
          leadingWidth: size.width * 0.2,
          centerTitle: false,
          title: ModCrewLogo(),
          actions: [
            authController.authToken.value == ""
                ? ForNotAuthUser(
                    cartBadge: cartBage(context),
                  )
                : ForAuthUser(
                    cartBadge: cartBage(context),
                  ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => TextButton(
                      style: TextButton.styleFrom(
                        primary: navObserver.index.value == 0
                            ? Colors.black
                            : Colors.black54,
                      ),
                      onPressed: () {
                        chnageIndex(0);
                        checkRouteName(RouteName.home)
                            ? null
                            : Navigator.of(context).pushNamed(RouteName.home);
                      },
                      child: Text("Home"),
                    )),
                SizedBox(width: 20),
                Obx(() => TextButton(
                      style: TextButton.styleFrom(
                        primary: navObserver.index.value == 1
                            ? Colors.black
                            : Colors.black54,
                      ),
                      onPressed: () {
                        chnageIndex(1);
                        checkRouteName(RouteName.shop)
                            ? null
                            : Navigator.of(context).pushNamed(RouteName.shop);
                      },
                      child: Text("Shop"),
                    )),
                SizedBox(width: 20),
                Obx(() => TextButton(
                      style: TextButton.styleFrom(
                        primary: navObserver.index.value == 2
                            ? Colors.black
                            : Colors.black54,
                      ),
                      onPressed: () {
                        chnageIndex(2);
                        checkRouteName(RouteName.aboutus)
                            ? null
                            : Navigator.of(context)
                                .pushNamed(RouteName.aboutus);
                      },
                      child: Text("About Us"),
                    )),
                SizedBox(width: 20),
                Obx(() => TextButton(
                      style: TextButton.styleFrom(
                        primary: navObserver.index.value == 3
                            ? Colors.black
                            : Colors.black54,
                      ),
                      onPressed: () {
                        chnageIndex(3);
                        checkRouteName(RouteName.contactus)
                            ? null
                            : Navigator.of(context)
                                .pushNamed(RouteName.contactus);
                      },
                      child: Text("Contact Us"),
                    )),
              ],
            ),
          ),
        ),
      ),
      body: widget.body,
    );
  }

  Widget cartBage(BuildContext context) {
    return Obx(() => Badge(
          badgeContent: Text(
            "${cartController.cartList.value.length}",
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w400,
            ),
          ),
          child: IconButton(
            hoverColor: Colors.white,
            onPressed: () {
              checkRouteName(RouteName.cart)
                  ? null
                  : Navigator.of(context).pushNamed(RouteName.cart);
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
          badgeColor: Customtheme.lightTheme.scaffoldBackgroundColor,
          position: BadgePosition(
            bottom: 20,
          ),
        ));
  }
}

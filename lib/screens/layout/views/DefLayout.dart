import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/widgets/widgets.dart';

import '../../screens.dart';

class NewTemplate extends StatefulWidget {
  final Widget sliverChild;
  const NewTemplate({
    Key? key,
    required this.sliverChild,
  }) : super(key: key);

  @override
  _NewTemplateState createState() => _NewTemplateState();
}

class _NewTemplateState extends State<NewTemplate> {
  TextEditingController _searchController = TextEditingController();
  final cartController = CartController.to;
  final authController = AuthController.to;
  final navController = NavController.to;
  SocialLauncher socialLauncher = SocialLauncher();
  naviagtion({required String routeName}) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: Color(appBarAndFooterBGColor),
            leadingWidth: size.width * 0.15,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    naviagtion(routeName: RouteName.home);
                  },
                  child: Text(
                    "Home",
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(width: 7.5),
                SizedBox(width: 7.5),
                InkWell(
                  onTap: () {
                    naviagtion(routeName: RouteName.fashion);
                  },
                  child: Text(
                    "Shop",
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(width: 7.5),
                SizedBox(width: 7.5),
                InkWell(
                  onTap: () {
                    naviagtion(routeName: RouteName.contactus);
                  },
                  child: Text(
                    "Contact Us",
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(width: 7.5),
                SizedBox(width: 7.5),
                InkWell(
                  onTap: () {
                    naviagtion(routeName: RouteName.aboutus);
                  },
                  child: Text(
                    "About",
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(width: 7.5),
                SizedBox(width: 7.5),
                InkWell(
                  onTap: () {
                    naviagtion(routeName: RouteName.home);
                  },
                  child: Text(
                    "Help",
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            actions: [
              InkWell(
                  onTap: socialLauncher.launchWhatsApp,
                  child: Icon(LineIcons.whatSApp, color: Colors.white)),
              SizedBox(width: 5),
              InkWell(
                  onTap: socialLauncher.launchFacebook,
                  child: Icon(LineIcons.facebook, color: Colors.white)),
              SizedBox(width: 5),
              InkWell(
                  onTap: socialLauncher.launchInstagram,
                  child: Icon(LineIcons.instagram, color: Colors.white)),
              SizedBox(width: 5),
              InkWell(
                  onTap: socialLauncher.launchTwitter,
                  child: Icon(LineIcons.twitter, color: Colors.white)),
              SizedBox(width: 20),
              authController.authToken.value != ""
                  ? InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteName.account);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage("assets/images/u7.png"),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteName.login);
                      },
                      child: Text(
                        "Login/Signup",
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
              SizedBox(width: 10),
            ],
            bottom: PreferredSize(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        ModCrewLogo(),
                        Spacer(),
                        DismissKeyboard(
                          child: SearchBar(
                            controller: _searchController,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(primaryColor),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Color(primaryColor),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/cart');
                          },
                          icon: Icon(Icons.shopping_cart),
                          label: Obx(
                            () => Text(
                                "Cart (${cartController.cartList.value.length})"),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    // SizedBox(height: 20),
                    // Container(
                    //   color: Color(primaryColor),
                    //   height: 40,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Obx(() => InkWell(
                    //             onTap: () {
                    //               naviagtion(routeName: RouteName.home);
                    //               navController.setIndex(i: 0);
                    //             },
                    //             child: Text(
                    //               "Home",
                    //               style: GoogleFonts.ubuntu(
                    //                   color:
                    //                       navController.selectedIndex.value == 0
                    //                           ? Colors.white
                    //                           : Colors.black,
                    //                   fontSize: 12),
                    //             ),
                    //           )),
                    //       SizedBox(width: 7.5),
                    //       VerticalDivider(
                    //         color: Colors.black,
                    //         indent: 10,
                    //         endIndent: 10,
                    //         width: 2,
                    //       ),
                    //       SizedBox(width: 7.5),
                    //       Obx(() => InkWell(
                    //             onTap: () {
                    //               naviagtion(routeName: RouteName.fashion);
                    //               navController.setIndex(i: 1);
                    //             },
                    //             child: Text(
                    //               "Shop",
                    //               style: GoogleFonts.ubuntu(
                    //                   color:
                    //                       navController.selectedIndex.value == 1
                    //                           ? Colors.white
                    //                           : Colors.black,
                    //                   fontSize: 12),
                    //             ),
                    //           )),
                    //       SizedBox(width: 7.5),
                    //       VerticalDivider(
                    //         color: Colors.black,
                    //         indent: 10,
                    //         endIndent: 10,
                    //         width: 2,
                    //       ),
                    //       SizedBox(width: 7.5),
                    //       Obx(() => InkWell(
                    //             onTap: () {
                    //               naviagtion(routeName: RouteName.contactus);
                    //               navController.setIndex(i: 2);
                    //             },
                    //             child: Text(
                    //               "Contact Us",
                    //               style: GoogleFonts.ubuntu(
                    //                   color:
                    //                       navController.selectedIndex.value == 2
                    //                           ? Colors.white
                    //                           : Colors.black,
                    //                   fontSize: 12),
                    //             ),
                    //           )),
                    //       SizedBox(width: 7.5),
                    //       VerticalDivider(
                    //         color: Colors.black,
                    //         indent: 10,
                    //         endIndent: 10,
                    //         width: 2,
                    //       ),
                    //       SizedBox(width: 7.5),
                    //       Obx(() => InkWell(
                    //             onTap: () {
                    //               naviagtion(routeName: RouteName.aboutus);
                    //               navController.setIndex(i: 3);
                    //             },
                    //             child: Text(
                    //               "About Us",
                    //               style: GoogleFonts.ubuntu(
                    //                   color:
                    //                       navController.selectedIndex.value == 3
                    //                           ? Colors.white
                    //                           : Colors.black,
                    //                   fontSize: 12),
                    //             ),
                    //           )),
                    //       SizedBox(width: 7.5),
                    //       VerticalDivider(
                    //         color: Colors.black,
                    //         indent: 10,
                    //         endIndent: 10,
                    //         width: 2,
                    //       ),
                    //       SizedBox(width: 7.5),
                    //       Obx(() => InkWell(
                    //             onTap: () {
                    //               naviagtion(routeName: RouteName.home);
                    //               navController.setIndex(i: 4);
                    //             },
                    //             child: Text(
                    //               "Help",
                    //               style: GoogleFonts.ubuntu(
                    //                   color:
                    //                       navController.selectedIndex.value == 4
                    //                           ? Colors.white
                    //                           : Colors.black,
                    //                   fontSize: 12),
                    //             ),
                    //           )),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(40),
            ),
          ),
          SliverFillRemaining(
            child: widget.sliverChild,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: DividerMessage(),
            ),
          ),
          SliverToBoxAdapter(
            child: Footer(),
          ),
        ],
      ),
    );
  }
}

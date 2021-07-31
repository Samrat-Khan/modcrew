import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/controller/cartController.dart';
import 'package:shopping_page/widgets/widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: Color(appBarAndFooterBGColor),
            leadingWidth: size.width * 0.2,
            centerTitle: true,
            leading: ModCrewLogo(),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Home",
                  style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 15),
                Text(
                  "Contact Us",
                  style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 15),
                Text(
                  "About Us",
                  style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 15),
                Text(
                  "Help",
                  style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {},
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Spacer(),
                    SearchBar(
                      controller: _searchController,
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
              ),
              preferredSize: Size.fromHeight(60),
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

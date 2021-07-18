import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/dummyData/cartData.dart';

class OtherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OtherAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          width: 190,
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
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
      ),
      preferredSize: Size.fromWidth(100),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/screens/signup_login/signup_login.dart';
import 'package:shopping_page/widgets/util/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Responsive.isDesktop(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FirstFooterContent(),
                    SecondFooterContent(),
                    ThirstFooterContent(),
                    FifthFooterContent(),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FirstFooterContent(),
                    SizedBox(height: 20),
                    SecondFooterContent(),
                    SizedBox(height: 20),
                    ThirstFooterContent(),
                    SizedBox(height: 20),
                    FifthFooterContent(),
                  ],
                ),
          Divider(
            endIndent: 50,
            indent: 50,
            color: Colors.white,
          ),
          Center(
            child: Text(
              "Copyright © 2021\nModCrew, All rights reserved",
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column FifthFooterContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "#JOINTHECREW",
          style: Styles.kFooterCategoryTitle,
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {},
          child: Text(
            "About Us",
            style: Styles.kFooterContent,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: Text(
            "BECOME AN AFFILIATE",
            style: Styles.kFooterContent,
          ),
        ),
      ],
    );
  }
}

class ThirstFooterContent extends StatelessWidget {
  const ThirstFooterContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CUSTOMER SERVICE",
          style: Styles.kFooterCategoryTitle,
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {},
          child: Text(
            "Contact Us",
            style: Styles.kFooterContent,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: Text(
            "Order Information",
            style: Styles.kFooterContent,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: Text(
            "Returns & Exchanges",
            style: Styles.kFooterContent,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: Text(
            "Privacy Policy",
            style: Styles.kFooterContent,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: Text(
            "Account Login",
            style: Styles.kFooterContent,
          ),
        ),
      ],
    );
  }
}

class SecondFooterContent extends StatelessWidget {
  const SecondFooterContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "BROWSE BY CATEGORY",
          style: Styles.kFooterCategoryTitle,
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {},
          child: Text(
            "Car",
            style: Styles.kFooterContent,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: Text(
            "Fashion",
            style: Styles.kFooterContent,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: Text(
            "Accessories",
            style: Styles.kFooterContent,
          ),
        ),
      ],
    );
  }
}

class FirstFooterContent extends StatelessWidget {
  const FirstFooterContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "modcrew",
          style: Styles.kFooterModcrewTitle,
        ),
        SizedBox(height: 10),
        Text(
          "support@modcrew.com",
          style: Styles.kFooterContent,
        ),
        SizedBox(height: 8),
        Text(
          "Call Us: +91-123456789",
          style: Styles.kFooterContent,
        ),
        SizedBox(height: 8),
        Text(
          "Monday-Friday 11AM - 5PM IST",
          style: Styles.kFooterContent,
        ),
        SizedBox(height: 8),
        Row(
          children: [
            InkWell(
              onTap: () => print("Google"),
              child: IconButtonWidget(path: 'assets/icons/google.png'),
            ),
            SizedBox(width: 8),
            InkWell(
              onTap: () => print("Facebook"),
              child: IconButtonWidget(path: 'assets/icons/facebook.png'),
            ),
            SizedBox(width: 8),
            InkWell(
              onTap: () => print("Twitter"),
              child: IconButtonWidget(path: 'assets/icons/twitter.png'),
            ),
          ],
        ),
        SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
          icon: Icon(Icons.shopping_cart),
          label: Text("Cart"),
        ),
      ],
    );
  }
}

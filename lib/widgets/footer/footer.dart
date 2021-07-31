import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/controller/cartController.dart';
import 'package:shopping_page/widgets/appBar/modCrewLogo.dart';
import 'package:shopping_page/widgets/util/responsive.dart';

class Footer extends StatelessWidget {
  Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Color(appBarAndFooterBGColor),
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 50),
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
                    fifthFooterContent(),
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
                    fifthFooterContent(),
                  ],
                ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Color(primaryColor),
            child: Center(
              child: Text(
                "Copyright © 2021\nModCrew, All rights reserved",
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column fifthFooterContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FooterContentTitle(text: "SUPPORT"),
        SizedBox(height: 10),
        InkWell(
          onTap: () {},
          child: FooterContent(text: "About Us"),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {},
          child: FooterContent(text: "Contact Us"),
        ),
        SizedBox(height: 8),
        // InkWell(
        //   onTap: () {},
        //   child: Text(
        //     "BECOME AN AFFILIATE",
        //     style: Styles.kFooterContent,
        //   ),
        // ),
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
        FooterContentTitle(text: "Resources"),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: FooterContent(text: "Order Information"),
        ),
        SizedBox(height: 8),
        InkWell(
            onTap: () {}, child: FooterContent(text: "Returns & Exchanges")),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: FooterContent(text: "Privacy Policy"),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: FooterContent(text: "Account Login"),
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
        FooterContentTitle(text: "BROWSE BY CATEGORY"),
        SizedBox(height: 10),
        InkWell(
          onTap: () {},
          child: FooterContent(text: "Home"),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: FooterContent(text: "About Us"),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: FooterContent(text: "Contact Us"),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: FooterContent(text: "Help"),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

class FirstFooterContent extends StatelessWidget {
  FirstFooterContent({
    Key? key,
  }) : super(key: key);
  final cartController = CartController.to;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ModCrewLogo(),
        FooterContent(
          text: "support@modcrew.com",
        ),
        SizedBox(height: 8),
        FooterContent(text: "Call Us: +91-123456789"),
        SizedBox(height: 8),
      ],
    );
  }
}

class FooterContentTitle extends StatelessWidget {
  final String text;
  const FooterContentTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.kFooterCategoryTitle,
    );
  }
}

class FooterContent extends StatelessWidget {
  final String text;
  const FooterContent({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.kFooterContent,
    );
  }
}

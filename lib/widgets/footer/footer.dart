import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/widgets/widgets.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Responsive.isDesktop(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FirstFooterContent(),
                    SecondFooterContent(),
                    ThirstFooterContent(),
                    fifthFooterContent(context: context),
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
                    fifthFooterContent(context: context),
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

  Column fifthFooterContent({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FooterContentTitle(text: "SUPPORT"),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RouteName.aboutus);
          },
          child: FooterContent(text: "About Us"),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RouteName.contactus);
          },
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
        FooterContentTitle(text: "Resources".toUpperCase()),
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
          onTap: () {
            Navigator.of(context).pushNamed(RouteName.privacy_policy);
          },
          child: FooterContent(text: "Privacy Policy"),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RouteName.signup);
          },
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
          onTap: () {
            Navigator.of(context).pushReplacementNamed(RouteName.fashion);
          },
          child: FooterContent(text: "Fashion"),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(RouteName.collectibles);
          },
          child: FooterContent(text: "Collectibles"),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RouteName.sizeChart);
          },
          child: FooterContent(text: "Size Chart"),
        ),

        // SizedBox(height: 8),
        // InkWell(
        //   onTap: () {},
        //   child: FooterContent(text: "Help"),
        // ),
        // SizedBox(height: 8),
      ],
    );
  }
}

class FirstFooterContent extends StatelessWidget {
  FirstFooterContent({
    Key? key,
  }) : super(key: key);
  // final cartController = CartController.to;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ModCrewLogo(),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                  child: Icon(
                Icons.email,
                color: Color(primaryColor),
                size: 14,
              )),
              TextSpan(
                text: "  support@modcrew.com",
                style: Styles.kFooterContent,
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                  child: Icon(
                Icons.phone,
                color: Color(primaryColor),
                size: 14,
              )),
              TextSpan(
                text: "  Call Us: +91-123456789",
                style: Styles.kFooterContent,
              ),
            ],
          ),
        ),
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
      "• " + text,
      style: Styles.kFooterContent,
    );
  }
}

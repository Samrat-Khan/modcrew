import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/screens/screens.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Container(
          height: size.width / 2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 50),
                    SelectableText(
                      "About Us",
                      style: GoogleFonts.ubuntu(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Color(primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(
                  endIndent: 50,
                  indent: 50,
                  color: Color(0xffBDBDBD),
                ),
                SizedBox(height: 20),
                Container(
                  width: size.width / 2,
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 2,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SelectableText(
                      "Check us out on Social Media:",
                      style: GoogleFonts.ubuntu(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(primaryColor),
                      ),
                    ),
                    SizedBox(height: 30),
                    SelectableText(
                      "Offical Company Instagram: @Modcrew",
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    SelectableText(
                      "Offical Facebook Page: @Modcrew_FB",
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final String message =
      'What is modcrew With a vision of having a merchandise brand totally focussed towards the automobile enthusiasts, to all the racing fans out there, we bring you Modcrew is all about speed, race, gears, and everything that excites you about the adventurous sport. We understand the thrill coursing through your veins and the desire to take a part of this excitement back home, and we enable you with all the merchandise that you need for your collection as a fan.';
}

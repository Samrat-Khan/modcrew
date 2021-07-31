import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';

class Styles {
  static var kAppBar = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );
  static var kLoginPageTitie = GoogleFonts.ubuntu(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  static kNavigationTextStyle(int index) {
    return GoogleFonts.ubuntu(
      color: Colors.black,
    );
  }

  static var kProductCardTextStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  static var kFooterCategoryTitle = GoogleFonts.ubuntu(
    fontWeight: FontWeight.bold,
    color: Color(primaryColor),
  );
  static var kFooterModcrewTitle = GoogleFonts.ubuntu(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static var kFooterContent = GoogleFonts.ubuntu(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 11,
  );
  static var contentTitleStyle = GoogleFonts.ubuntu(
    fontWeight: FontWeight.w900,
  );
  static var contentStyle = GoogleFonts.ubuntu(
    fontWeight: FontWeight.w800,
  );
  static var subContentStyle = GoogleFonts.ubuntu(
    fontWeight: FontWeight.w700,
  );
  static var dividerMessageStyles = GoogleFonts.ubuntu(
    // fontWeight: FontWeight.w900,
    color: Colors.white,
  );
  static var tabTextStyle = GoogleFonts.ubuntu(
    fontWeight: FontWeight.w800,
  );
  static var logInPageTitle = GoogleFonts.ubuntu(
    fontWeight: FontWeight.bold,
  );
  static var logInPageForgotPassword = GoogleFonts.ubuntu(
    fontWeight: FontWeight.w900,
  );
  static var logInPageOtherStyle = GoogleFonts.ubuntu(
    fontWeight: FontWeight.w600,
  );
  static var confrimOrderMessage = GoogleFonts.ubuntu(
    fontWeight: FontWeight.w800,
    fontSize: 20,
  );
  static var confrimOrderId = GoogleFonts.ubuntu(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static var pdPageProductTitle = GoogleFonts.ubuntu();
  static var pdPageProductPrice = GoogleFonts.ubuntu();
  static var pdPageProductDesc = GoogleFonts.ubuntu();
  static var pdPageProductFilterChip = GoogleFonts.ubuntu();
}

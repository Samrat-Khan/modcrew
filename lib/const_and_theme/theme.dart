import 'package:flutter/material.dart';

import 'colors.dart';

class Customtheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Color(activeColorAndBg),
      backgroundColor: Color(0xffebeaef),
      textTheme: ThemeData.light().textTheme,
      accentColor: Color(0xff6f68fd),
      primaryColor: Color(0xffebeaef),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 18,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Color(0xffebeaef),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.black,
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.black,
          textStyle: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

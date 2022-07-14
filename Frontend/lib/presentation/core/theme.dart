import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeFile {
  static TextTheme textTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    //head line1 style
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.w700, color: Colors.black),
    //head line2 style
    headline2: GoogleFonts.openSans(
        fontSize: 23.0, fontWeight: FontWeight.w600, color: Colors.black),
    //head line3 style
    headline3: GoogleFonts.openSans(
        fontSize: 19.0, fontWeight: FontWeight.w600, color: Colors.black),
    headline4: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),
    headline5: GoogleFonts.openSans(
        color: const Color.fromARGB(255, 47, 198, 209),
        fontSize: 20,
        fontWeight: FontWeight.w500),

    //head line6 style
    headline6: GoogleFonts.openSans(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static ThemeData themeData() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      textTheme: textTheme,
    );
  }
}

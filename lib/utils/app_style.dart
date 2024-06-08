import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Color primary=const Color(0xff3d0312);
Color secondary=const Color(0xffFF7F74);

class Styles {
  static Color primaryColor = primary;

  static const mainColor = Color(0xff3d0312);
  static const secColor = Color(0xff7e0303);
  static const paigeColor = Color(0xffc89665);
  static const paigeToBrownColor = Color(0xff956744);
  static const brownColor = Color(0xff644127);

  static Color bgColor = const Color(0xffF5F5F5);
  static Color headerColor = const Color(0xff2B2B2B);

  static Color titleTextColor = const Color(0xFF2C321B);
  static Color subTextColor = const Color(0xFFA3A59B);


  static TextStyle textStyle =
  GoogleFonts.roboto(color: titleTextColor, fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle headLineStyle1 =
  GoogleFonts.roboto(fontSize: 26, color: titleTextColor, fontWeight: FontWeight.bold);

  static TextStyle headLineStyle2 =
  GoogleFonts.roboto(fontSize: 21, color: titleTextColor, fontWeight: FontWeight.bold);

  static TextStyle headLineStyle3 = GoogleFonts.roboto(
      fontSize: 17, color: subTextColor, fontWeight: FontWeight.w500);

  static TextStyle headLineStyle4 = GoogleFonts.roboto(
      fontSize: 14, color: subTextColor , fontWeight: FontWeight.w500);
}

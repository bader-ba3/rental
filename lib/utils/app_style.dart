import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class Styles {

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

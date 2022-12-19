import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  static const MaterialColor appPrimaryColor = Colors.orange;
  static const String titleText = "Average Grade Calculator";
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: appPrimaryColor);
  static final BorderRadius appBorderRadius = BorderRadius.circular(24);
  static final TextStyle averageBodyStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: appPrimaryColor);
  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: appPrimaryColor);
  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final allPadding = EdgeInsets.all(8.0);
  static final verticalPadding = EdgeInsets.symmetric(vertical: 3.0);
}

import 'package:flutter/material.dart';

class AppTheme{
  static Color primaryColor =const Color(0xFF39A552);
  static Color whiteColor =Colors.white;
  static Color blackColor =const Color(0xFF303030);
  static Color redColor =const Color(0xFFC91C22);
  static Color darkBlueColor =const Color(0xFF4F5A69);
  static Color lightBlueColor =const Color(0xFF003E90);
  static Color roseColor =const Color(0xFFED1E79);
  static Color orangeColor =const Color(0xFFCF7E48);
  static Color fadedBlue =const Color(0xFF4882CF);
  static Color yellow =const Color(0xFFF2D352);
  static Color grey =const Color(0xFF79828B);

  static ThemeData lightTheme=ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: whiteColor
      ),
      foregroundColor: whiteColor,
      backgroundColor: primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(35),
        ),
      ),
      centerTitle: true,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor
    ),
    indicatorColor: primaryColor,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: whiteColor
      ),
      bodyMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: darkBlueColor
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        color: grey
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: blackColor
      ),
    )
  );
}
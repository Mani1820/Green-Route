import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: ColorExtension.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorExtension.primaryColor,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: ColorExtension.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorExtension.primaryColor,
    ),
  );

  static TextStyle cardTextTheme = TextStyle(
    color: ColorExtension.primarytextColor,
    fontFamily: 'poppins',
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}

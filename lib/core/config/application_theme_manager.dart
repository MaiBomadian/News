import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static ThemeData applicationThemeData = ThemeData(
    primaryColor: const Color(0xff39A552),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff39A552),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 35,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: 'Exo',
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        fontFamily: 'Exo',
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 22,
        fontFamily: 'Exo',
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: 'Exo',
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 10,
        fontFamily: 'Exo',
        color: Colors.white,
      ),
    ),
  );
}

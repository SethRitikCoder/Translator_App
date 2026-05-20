import 'package:flutter/material.dart';

class Themeservices {
  static ThemeData get themelight {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromRGBO(0, 168, 132, 2),
      ),
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Color.fromRGBO(0, 168, 132, 2),
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Color.fromRGBO(166, 235, 220, 1),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 2.0,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontFamily: "Caveat",
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          opacity: 1.0,
          weight: 250,
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontFamily: "Caveat",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData get themedark {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromRGBO(0, 168, 132, 2),
      ),
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Color.fromRGBO(0, 168, 132, 2),
      cardColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      canvasColor: Color.fromRGBO(166, 235, 220, 1),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 2.0,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontStyle: FontStyle.values[3],
          fontFamily: "Caveat",
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          opacity: 1.0,
          weight: 250,
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontStyle: FontStyle.values[3],
          fontFamily: "Caveat",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

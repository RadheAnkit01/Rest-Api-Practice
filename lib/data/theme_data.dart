import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    textTheme: TextTheme(),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
    ),

    scaffoldBackgroundColor: const Color.fromARGB(255, 173, 202, 253),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,

    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 25, 67),
      foregroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 1, 60, 163),
  );
}

import 'package:flutter/material.dart';

class AppTheme {
  static Color darkBgColor = const Color.fromARGB(255, 0, 25, 67);
  static Color lightBgColor = const Color.fromARGB(255, 173, 202, 253);

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    colorScheme: ColorScheme.light(surface: Colors.white),
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    ),

    scaffoldBackgroundColor: lightBgColor,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,
    colorScheme: ColorScheme.dark(surface: Colors.black38),

    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: darkBgColor,
      foregroundColor: Colors.white,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkBgColor,
        foregroundColor: Colors.white,
      ),
    ),

    scaffoldBackgroundColor: const Color.fromARGB(255, 1, 60, 163),
  );
}

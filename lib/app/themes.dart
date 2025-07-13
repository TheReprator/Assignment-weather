import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
    appBarTheme: AppThemes.appBarTheme,
    scaffoldBackgroundColor: const Color.fromARGB(255, 220, 225, 209),
  );
  static AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 11, 8, 222),
  );
}

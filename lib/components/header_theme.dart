import 'package:flutter/material.dart';

class HeaderTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      colorSchemeSeed: const Color.fromARGB(255, 15, 12, 29),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 24, 18, 43),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 44,
          fontFamily: "Built-SemiBold",
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF8D6E63),
      ),
    );
  }
}

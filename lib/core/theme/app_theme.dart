import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  ThemeData getTheme() {
    return ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue));
  }
}

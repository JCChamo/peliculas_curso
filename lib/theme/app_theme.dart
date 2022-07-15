import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Colors.indigo;
  static final lightTheme = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
          color: primaryColor, elevation: 0, centerTitle: true));
}

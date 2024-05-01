import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey[50],
      primary: Colors.grey.shade100,
      secondary: Colors.grey.shade300,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey[900],
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
    ));

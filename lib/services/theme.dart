import 'package:flutter/material.dart';

const textColor = Color(0xff20202F);

final ThemeData myTheme = ThemeData(
  primaryColor: const Color(0xFF2689B0),
  scaffoldBackgroundColor: const Color(0xffFAF9FA),
  iconTheme: const IconThemeData(color: textColor),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontFamily: 'Rubik', color: textColor),
    headlineMedium: TextStyle(fontFamily: 'Rubik', color: textColor),
    headlineSmall: TextStyle(fontFamily: 'Rubik', color: textColor),
    titleLarge: TextStyle(fontFamily: 'Rubik', color: textColor),
    titleMedium: TextStyle(fontFamily: 'Rubik', color: textColor),
    titleSmall: TextStyle(fontFamily: 'Rubik', color: textColor),
    displayLarge: TextStyle(fontFamily: 'Rubik', color: textColor),
    displayMedium: TextStyle(fontFamily: 'Rubik', color: textColor),
    displaySmall: TextStyle(fontFamily: 'Rubik', color: textColor),
    labelLarge: TextStyle(fontFamily: 'Rubik', color: textColor),
    labelMedium: TextStyle(fontFamily: 'Rubik', color: textColor),
    labelSmall: TextStyle(fontFamily: 'Rubik', color: textColor),
    bodyLarge: TextStyle(fontFamily: 'Rubik', color: textColor),
    bodyMedium: TextStyle(fontFamily: 'Rubik', color: textColor),
  ),
);

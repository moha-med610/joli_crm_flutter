import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0XFF161618),

  appBarTheme: AppBarTheme(backgroundColor: const Color(0XFF161618)),

  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: const Color(0XFF2A2A2A), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: const Color(0XFF4DA3FF), width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
    fillColor: Colors.grey.shade900,
    filled: true,
    hintStyle: TextStyle(
      color: Colors.grey.shade700,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),

  primaryTextTheme: TextTheme(
    headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
    labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(0.8),
      backgroundColor: const WidgetStatePropertyAll(Color(0XFF004643)),
      shadowColor: WidgetStatePropertyAll(Colors.black),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),

  navigationDrawerTheme: NavigationDrawerThemeData(
    backgroundColor: const Color(0XFF004643),
    indicatorColor: Colors.black12,
    labelTextStyle: WidgetStatePropertyAll(
      TextStyle(
        color: Colors.grey.shade50,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
    iconTheme: WidgetStatePropertyAll(
      IconThemeData(color: Colors.grey.shade50),
    ),
    elevation: 0.5,
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
);

import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  scaffoldBackgroundColor: const Color(0XFFFFFFFF),

  appBarTheme: AppBarTheme(backgroundColor: const Color(0XFFFFFFFF)),

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

  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: const Color(0XFFC4C4C4), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: const Color(0XFFC4C4C4), width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
    fillColor: const Color(0XFFFFFFFF),
    filled: true,
    hintStyle: TextStyle(
      color: Colors.grey.shade500,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),

  primaryTextTheme: TextTheme(
    headlineLarge: TextStyle(
      color: const Color(0XFF004643),
      fontSize: 24,
      fontWeight: FontWeight.w900,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
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
);

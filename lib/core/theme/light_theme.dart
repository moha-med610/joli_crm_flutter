import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  scaffoldBackgroundColor: const Color(0XFFf5f5f5),

  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0XFFf5f5f5),
    surfaceTintColor: Colors.white,
  ),

  drawerTheme: DrawerThemeData(backgroundColor: Colors.black54, elevation: 0.5),

  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: const Color(0XFFf5f5f5),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: const Color(0XFF004643),
    foregroundColor: Colors.white,
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
);

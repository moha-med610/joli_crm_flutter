import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  scaffoldBackgroundColor: const Color(0xFF161618),

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF0EA5A4),
    secondary: Color(0xFF7DD3C7),

    surface: Color(0xFF1F1F22),
    surfaceContainer: Color(0xFF2A2A2D),

    onSurface: Colors.white,
    onSurfaceVariant: Color(0xFFB5B5B5),

    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF161618),
    elevation: 0,
    foregroundColor: Colors.white,
  ),

  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xFF1E1E20),
    elevation: 0,
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFF1E1E20),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF004643),
    foregroundColor: Colors.white,
  ),

  cardColor: const Color(0xFF1E1E20),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF252529),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFF004643), width: 1.5),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red),
    ),

    hintStyle: TextStyle(
      color: Colors.grey.shade500,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),

  textTheme: GoogleFonts.readexProTextTheme(
    const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w900,
      ),

      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      labelMedium: TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      backgroundColor: const Color(0xFF004643),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),

  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.white),
    trackColor: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? const Color(0xFF004643)
          : Colors.grey.shade700,
    ),
  ),
);

import 'package:flutter/cupertino.dart';

class AppScreens {
  final String title;
  final Icon icon;
  final Widget screen;
  final int index;

  AppScreens({
    required this.title,
    required this.icon,
    required this.screen,
    required this.index,
  });
}

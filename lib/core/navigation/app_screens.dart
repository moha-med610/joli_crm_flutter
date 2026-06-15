import 'package:flutter/cupertino.dart';
import 'package:joli_crm/core/enum/role_enum.dart';

class AppScreens {
  final String title;
  final Widget icon;
  final Widget screen;
  final String id;
  final List<RoleEnum> roles;

  AppScreens({
    required this.title,
    required this.icon,
    required this.screen,
    required this.id,
    required this.roles,
  });
}

import 'package:flutter/cupertino.dart';
import 'package:joli_crm/core/enum/role_enum.dart';
import 'package:joli_crm/core/navigation/app_screens.dart';
import 'package:joli_crm/features/customers/presentation/screens/customers_screen.dart';
import 'package:joli_crm/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:joli_crm/features/settings/presentation/screen/settings_screen.dart';

List<AppScreens> getDrawerItems() => [
  AppScreens(
    title: "dashboard",
    icon: const Icon(CupertinoIcons.home, fontWeight: FontWeight.bold),
    screen: DashboardScreen(),
    id: "dashboard",
    roles: [RoleEnum.COMPANY],
  ),
  AppScreens(
    title: "customers",
    icon: const Icon(CupertinoIcons.group_solid, fontWeight: FontWeight.bold),
    screen: CustomersScreen(),
    id: "customers",
    roles: [RoleEnum.COMPANY],
  ),
  AppScreens(
    title: "settings",
    icon: const Icon(CupertinoIcons.settings),
    screen: SettingsScreen(),
    id: "settings",
    roles: [RoleEnum.COMPANY],
  ),
];

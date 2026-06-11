import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joli_crm/core/enum/role_enum.dart';
import 'package:joli_crm/core/navigation/app_screens.dart';
import 'package:joli_crm/features/customers/presentation/screens/customers_screen.dart';
import 'package:joli_crm/features/dashboard/presentation/screens/dashboard_screen.dart';

List<AppScreens> drawerItems = [
  AppScreens(
    title: "dashboard",
    icon: Icon(CupertinoIcons.home, color: Colors.white),
    screen: DashboardScreen(),
    id: "dashboard",
    roles: [RoleEnum.ADMIN, RoleEnum.COMPANY],
  ),

  AppScreens(
    title: "Customers",
    icon: Icon(CupertinoIcons.group_solid, color: Colors.white),
    screen: CustomersScreen(),
    id: "customers",
    roles: [RoleEnum.COMPANY],
  ),
];

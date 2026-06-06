import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/logic/app_cubit.dart';
import 'package:joli_crm/core/navigation/app_screens.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:joli_crm/features/auth/presentation/screens/login_screen.dart';

List<AppScreens> drawerItems = [
  AppScreens(
    title: "dashboard",
    icon: Icon(CupertinoIcons.home),
    screen: BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: Column(
              children: [
                Center(child: Text("dashboard")),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale("ar"));
                  },
                  child: Text("Arabic"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale("en"));
                  },
                  child: Text("English"),
                ),
                BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    return Switch(
                      value: state.isDark,
                      onChanged: (value) {
                        context.read<AppCubit>().toggleDarkMode();
                      },
                    );
                  },
                ),

                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        print("Logout");
                        context.read<AuthCubit>().logout();

                        context.pushAndRemoveUntil(LoginScreen());
                      },
                      child: Text("Logout"),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    ),
    index: 0,
  ),

  AppScreens(
    title: "Customers",
    icon: Icon(CupertinoIcons.group_solid),
    screen: Scaffold(body: Center(child: Text("customers"))),
    index: 1,
  ),
];

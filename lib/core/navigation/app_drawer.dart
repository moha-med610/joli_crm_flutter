import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joli_crm/core/constants/storage_keys.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:joli_crm/features/auth/presentation/screens/login_screen.dart';
import 'package:joli_crm/features/auth/presentation/widgets/logout.dart';
import 'package:joli_crm/features/main/presentation/logic/main_cubit.dart';
import 'package:joli_crm/main.dart';

import 'app_screens.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.items});

  final List<AppScreens> items;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/joli_crm_logo.svg", width: 50),
                  SizedBox(width: 20),
                  Text(
                    "JOLI CRM",
                    style: Theme.of(context).primaryTextTheme.headlineLarge,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                flex: 10,
                child: BlocBuilder<MainCubit, MainState>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: state.screens.length,
                      itemBuilder: (context, index) {
                        final screen = state.screens[index];
                        return ListTile(
                          leading: screen.icon,
                          title: Text(
                            screen.title,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.white70,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          onTap: () {
                            context.read<MainCubit>().changeScreen(screen.id);
                            context.pop();
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              Spacer(),
              Logout(
                onTap: () {
                  context.read<AuthCubit>().logout();
                  secureStorage.delete(key: StorageKeys.accessToken);
                  secureStorage.delete(key: StorageKeys.refreshToken);
                  prefs.remove(key: StorageKeys.role);
                  context.pushAndRemoveUntil(LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

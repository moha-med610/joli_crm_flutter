import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/navigation/drawer_items.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/features/main/presentation/logic/main_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return NavigationDrawer(
          selectedIndex: state.currentIndex,
          onDestinationSelected: (index) {
            context.read<MainCubit>().changeScreen(index);
            context.pop();
          },
          children: drawerItems.map((screen) {
            return NavigationDrawerDestination(
              icon: screen.icon,
              label: Text(screen.title.tr()),
            );
          }).toList(),
        );
      },
    );
  }
}

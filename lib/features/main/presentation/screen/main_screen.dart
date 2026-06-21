import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/navigation/app_drawer.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/features/main/presentation/logic/main_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit()..getScreens(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state.screens.isEmpty) {
            return const SizedBox();
          }

          final currentScreen = state.screens.firstWhere(
            (screen) => screen.id == state.currentId,
          );

          return AppLayout(
            drawer: AppDrawer(items: state.screens),
            appBar: AppBarWidget(title: currentScreen.title.tr()),
            child: currentScreen.screen,
          );
        },
      ),
    );
  }
}

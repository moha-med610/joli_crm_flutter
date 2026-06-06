import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joli_crm/core/navigation/app_drawer.dart';
import 'package:joli_crm/core/navigation/drawer_items.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/features/main/presentation/logic/main_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) => AppLayout(
          drawer: AppDrawer(),
          appBar: AppBarWidget(
            title: Text(
              drawerItems[state.currentIndex].title.tr(),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          child: drawerItems[state.currentIndex].screen,
        ),
      ),
    );
  }
}

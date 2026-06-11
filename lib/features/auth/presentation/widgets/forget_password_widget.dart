import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/logic/app_cubit.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final bool isDark = context.watch<AppCubit>().state.isDark;
          return GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: Text(
                "forget_password".tr(),
                style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
                  color: isDark ? Colors.white70 : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

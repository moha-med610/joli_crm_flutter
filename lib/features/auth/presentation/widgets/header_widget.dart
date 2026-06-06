import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/svgs/joli_crm_logo.svg", width: 100.w),
        SizedBox(height: 30.h),
        Text(
          "Login_to_your_account".tr(),
          style: Theme.of(context).primaryTextTheme.headlineLarge,
        ),
      ],
    );
  }
}

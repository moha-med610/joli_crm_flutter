import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoNotHaveAccountWidget extends StatelessWidget {
  const DoNotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "do_not_have_account".tr(),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
        children: [
          TextSpan(
            text: "+201020130763",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

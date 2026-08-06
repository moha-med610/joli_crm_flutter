import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joli_crm/core/logic/app_cubit.dart';

class CustomerInformationWidget extends StatelessWidget {
  const CustomerInformationWidget({
    super.key,
    required this.fieldName,
    required this.data,
  });

  final String fieldName;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          fieldName,
          style: TextStyle(fontSize: 20.sp, fontWeight: .w900),
        ),
        SizedBox(height: 5.h),
        Container(
          padding: const .all(10),
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: .infinity),
          decoration: BoxDecoration(
            borderRadius: .circular(10),
            color: context.read<AppCubit>().state.isDark
                ? Colors.grey.shade800
                : Colors.grey.shade400,
          ),
          child: Text(
            data,
            style: TextStyle(fontSize: 20.sp, fontWeight: .bold),
          ),
        ),
      ],
    );
  }
}

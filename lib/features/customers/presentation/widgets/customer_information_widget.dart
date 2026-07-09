import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            color: Theme.of(context).colorScheme.surface,
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

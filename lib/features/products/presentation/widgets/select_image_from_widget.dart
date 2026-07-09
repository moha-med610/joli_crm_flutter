import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectImageFromWidget extends StatelessWidget {
  const SelectImageFromWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });

  final Function()? onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: .circular(10),
      child: Container(
        padding: const .all(10),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20.sp, fontWeight: .bold),
            ),
            const Spacer(),
            Icon(icon, size: 30),
          ],
        ),
      ),
    );
  }
}

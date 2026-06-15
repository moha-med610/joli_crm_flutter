import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.child,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 48,
  });

  final Widget child;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height.h,
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }
}

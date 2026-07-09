import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({
    super.key,
    this.height = 48,
    this.width = double.infinity,
    this.rounded = 10,
    required this.onTap,
  });

  final VoidCallback onTap;
  final double width;
  final double height;
  final double rounded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.red.shade900,
          borderRadius: BorderRadius.circular(rounded),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout, color: Colors.white),
            const SizedBox(width: 30),
            Text(
              "logout".tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  final void Function() onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(label),
      icon: Icon(icon),
    );
  }
}

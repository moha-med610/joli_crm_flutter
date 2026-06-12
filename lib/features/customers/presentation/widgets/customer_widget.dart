import 'package:flutter/material.dart';

class CustomerWidget extends StatelessWidget {
  const CustomerWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  final Function()? onTap;
  final String title;
  final String subtitle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(trailing),
        style: .list,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.all(8),
        focusColor: Colors.grey,
      ),
    );
  }
}

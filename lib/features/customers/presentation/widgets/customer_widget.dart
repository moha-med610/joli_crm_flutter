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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text(
            trailing,
            style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
              color: Colors.grey.shade900,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          contentPadding: EdgeInsets.all(14),
          splashColor: Colors.black,
          tileColor: Colors.grey.shade300,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.centerTitle = true,
    this.leading,
    this.actions,
  });

  final String? title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.toString(),
        style: Theme.of(
          context,
        ).textTheme.headlineLarge!.copyWith(color: Colors.black),
      ),
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

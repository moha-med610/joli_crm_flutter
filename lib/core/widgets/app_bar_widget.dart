import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.centerTitle = true,
    this.leading,
    this.actions,
    this.color,
  });

  final String? title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      title: Text(
        title.toString(),
        style: TextStyle(fontSize: 22.sp, fontWeight: .w800),
      ),
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

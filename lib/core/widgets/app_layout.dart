import 'package:flutter/material.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    super.key,
    required this.child,
    this.appBar = const AppBarWidget(),
    this.bgColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Color? bgColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar,
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(18.0), child: child),
      ),
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
    );
  }
}

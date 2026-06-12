import 'package:flutter/material.dart';

Future<void> bottomSheetWidget(
  BuildContext context, {
  required String title,
  required List<Widget> children,
}) async {
  return showModalBottomSheet(
    isScrollControlled: true,
    sheetAnimationStyle: AnimationStyle(
      curve: Curves.bounceInOut,
      duration: Duration(milliseconds: 300),
      reverseCurve: Curves.bounceOut,
    ),
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(20)),
    ),
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).primaryTextTheme.headlineLarge!.copyWith(color: Colors.black),
              ),
              SizedBox(height: 20),
              Column(children: children),
            ],
          ),
        ),
      );
    },
  );
}

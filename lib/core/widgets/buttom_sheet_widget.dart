import 'package:flutter/material.dart';

Future<void> bottomSheetWidget(
  BuildContext context, {
  required String title,
  required List<Widget> children,
}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 18,
          right: 18,
          top: 18,
          bottom: MediaQuery.of(context).viewInsets.bottom + 18,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).primaryTextTheme.headlineLarge!.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 20),
              ...children,
            ],
          ),
        ),
      );
    },
  );
}

import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(15),
      width: .infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: .circular(15),
        border: .all(width: .1),
      ),
      child: Row(mainAxisAlignment: .spaceBetween, children: children),
    );
  }
}

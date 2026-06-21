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
        borderRadius: .circular(15),
        border: .all(color: Colors.grey, width: .5),
      ),
      child: Row(mainAxisAlignment: .spaceBetween, children: children),
    );
  }
}

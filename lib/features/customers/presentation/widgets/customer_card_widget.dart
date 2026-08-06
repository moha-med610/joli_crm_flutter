import 'package:flutter/material.dart';

class CustomerCardWidget extends StatelessWidget {
  const CustomerCardWidget({
    super.key,
    required this.header,
    required this.fields,
  });

  final String header;
  final List<Widget> fields;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade500, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header, style: Theme.of(context).primaryTextTheme.headlineLarge),
          const SizedBox(height: 10),
          ...fields,
        ],
      ),
    );
  }
}

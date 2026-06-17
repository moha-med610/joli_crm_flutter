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
      padding: .all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: .circular(20),
        border: BoxBorder.all(color: Colors.grey.shade400, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(header, style: Theme.of(context).primaryTextTheme.headlineLarge),
          SizedBox(height: 10),
          ...fields,
        ],
      ),
    );
  }
}

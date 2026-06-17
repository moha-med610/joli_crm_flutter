import 'package:flutter/material.dart';

class CustomerInformationWidget extends StatelessWidget {
  const CustomerInformationWidget({
    super.key,
    required this.fieldName,
    required this.data,
  });

  final String fieldName;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          fieldName,
          style: Theme.of(
            context,
          ).primaryTextTheme.labelMedium!.copyWith(fontWeight: .bold),
        ),
        Container(
          padding: .all(10),
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: .infinity),
          decoration: BoxDecoration(
            borderRadius: .circular(10),
            color: Colors.grey.shade300,
          ),
          child: Text(
            data,
            style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
              fontWeight: .bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

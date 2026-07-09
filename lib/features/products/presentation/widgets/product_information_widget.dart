import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  const ProductInformationWidget({
    super.key,
    required this.filedName,
    required this.data,
  });

  final String filedName;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .all(14),
      width: .infinity,
      decoration: BoxDecoration(
        borderRadius: .circular(20),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              filedName,
              style: const TextStyle(fontSize: 20, fontWeight: .w500),
            ),
          ),
          Expanded(
            child: Text(
              data,
              style: const TextStyle(fontSize: 20, fontWeight: .bold),
            ),
          ),
        ],
      ),
    );
  }
}

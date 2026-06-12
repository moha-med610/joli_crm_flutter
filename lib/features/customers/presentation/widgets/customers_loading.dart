import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'customer_widget.dart';

class CustomersLoading extends StatelessWidget {
  const CustomersLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return CustomerWidget(
            title: "title",
            subtitle: "subtitle",
            trailing: "trailing",
          );
        },
      ),
    );
  }
}

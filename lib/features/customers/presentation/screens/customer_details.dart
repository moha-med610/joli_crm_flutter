import 'package:flutter/material.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appBar: AppBarWidget(title: "Customer Details"),
      child: Center(child: Text(id)),
    );
  }
}

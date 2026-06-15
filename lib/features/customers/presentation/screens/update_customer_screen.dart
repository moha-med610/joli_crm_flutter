import 'package:flutter/material.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';

class UpdateCustomerScreen extends StatefulWidget {
  const UpdateCustomerScreen({
    super.key,
    // required this.id,
    // required this.name,
    // required this.phone,
    // required this.address,
    // required this.city,
    // required this.whatsapp,
    // required this.notes,
  });

  // final String id;
  // final String name;
  // final String phone;
  // final String address;
  // final String city;
  // final String whatsapp;
  // final String notes;

  @override
  State<UpdateCustomerScreen> createState() => _UpdateCustomerScreenState();
}

class _UpdateCustomerScreenState extends State<UpdateCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appBar: AppBarWidget(title: "Edit Customer"),
      child: Column(children: []),
    );
  }
}

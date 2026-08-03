import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';

class UpdateProductScreen extends StatelessWidget {
  const UpdateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appBar: AppBarWidget(title: "update_product".tr()),
      child: const Column(),
    );
  }
}

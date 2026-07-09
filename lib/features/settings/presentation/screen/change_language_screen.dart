import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appBar: AppBarWidget(title: "change_lang".tr()),
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              await context.setLocale(const Locale("ar"));
              if (!context.mounted) return;
              context.pop();
            },
            child: const Directionality(
              textDirection: .rtl,
              child: ListTile(
                title: Text(
                  "العربيه",
                  style: TextStyle(fontSize: 20, fontWeight: .bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () async {
              await context.setLocale(const Locale("en"));
              if (!context.mounted) return;
              context.pop();
            },
            child: const Directionality(
              textDirection: .ltr,
              child: ListTile(
                title: Text(
                  "English",
                  style: TextStyle(fontSize: 20, fontWeight: .bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

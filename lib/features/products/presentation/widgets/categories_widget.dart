import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, this.onTap, this.category});

  final Function()? onTap;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "categories".tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Visibility(
              visible: category != null,
              child: Text(
                "$category",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Icon(Icons.category_rounded),
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joli_crm/core/utils/app_validator.dart';
import 'package:joli_crm/core/widgets/buttom_sheet_widget.dart';
import 'package:joli_crm/core/widgets/button_widget.dart';
import 'package:joli_crm/core/widgets/text_form_field_widget.dart';

Future<void> customerSheet(
  BuildContext context, {
  required void Function() onSubmit,
  required TextEditingController cNameController,
  required TextEditingController cPhoneController,
  required TextEditingController cAddressController,
  required TextEditingController cCityController,
  required TextEditingController cWhatsappController,
  required TextEditingController cNotsController,
  required GlobalKey<FormState> formKey,
  required String buttonText,
  bool isLoading = false,
  required String header,
}) {
  return bottomSheetWidget(
    context,
    title: header,
    children: [
      Form(
        key: formKey,
        child: Column(
          children: [
            TextFormFieldWidget(
              controller: cNameController,
              hint: "name".tr(),
              validator: AppValidator.name,
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              controller: cPhoneController,
              hint: "phone".tr(),
              validator: AppValidator.phone,
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              controller: cAddressController,
              hint: "address".tr(),
              validator: AppValidator.address,
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              controller: cCityController,
              hint: "city".tr(),
              validator: AppValidator.city,
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              controller: cWhatsappController,
              hint: "whatsapp".tr(),
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              controller: cNotsController,
              hint: "notes".tr(),
              minLines: 5,
              maxLines: 5,
            ),
          ],
        ),
      ),
      const SizedBox(height: 30),
      isLoading
          ? const CupertinoActivityIndicator()
          : ButtonWidget(
              onPressed: onSubmit,
              child: Text(
                buttonText,
                style: Theme.of(
                  context,
                ).primaryTextTheme.labelMedium!.copyWith(color: Colors.white),
              ),
            ),
    ],
  );
}

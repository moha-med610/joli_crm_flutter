import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joli_crm/core/utils/app_validator.dart';
import 'package:joli_crm/core/widgets/buttom_sheet_widget.dart';
import 'package:joli_crm/core/widgets/button_widget.dart';
import 'package:joli_crm/core/widgets/text_form_field_widget.dart';

Future<void> customerSheet(
  BuildContext context, {
  /// Return `true` when operation succeeded and sheet should close.
  required Future<bool> Function({
    required String name,
    required String phone,
    String? whatsapp,
    required String address,
    required String city,
    String? notes,
  }) onSubmit,
  required String initialName,
  required String initialPhone,
  required String initialAddress,
  required String initialCity,
  String? initialWhatsapp,
  String? initialNotes,
  required String buttonText,
  bool isLoading = false,
  required String header,
}) async {
  final formKey = GlobalKey<FormState>();

  final cNameController = TextEditingController(text: initialName);
  final cPhoneController = TextEditingController(text: initialPhone);
  final cAddressController = TextEditingController(text: initialAddress);
  final cCityController = TextEditingController(text: initialCity);
  final cWhatsappController = TextEditingController(text: initialWhatsapp ?? '');
  final cNotsController = TextEditingController(text: initialNotes ?? '');

  await bottomSheetWidget(
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
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final success = await onSubmit(
                    name: cNameController.text.trim(),
                    phone: cPhoneController.text.trim(),
                    whatsapp: cWhatsappController.text.trim().isEmpty
                        ? null
                        : cWhatsappController.text.trim(),
                    address: cAddressController.text.trim(),
                    city: cCityController.text.trim(),
                    notes: cNotsController.text.trim().isEmpty
                        ? null
                        : cNotsController.text.trim(),
                  );
                  if (success) Navigator.of(context).pop();
                }
              },
              child: Text(
                buttonText,
                style: Theme.of(
                  context,
                ).primaryTextTheme.labelMedium!.copyWith(color: Colors.white),
              ),
            ),
    ],
  );

  // dispose controllers after sheet closed
  cNameController.dispose();
  cPhoneController.dispose();
  cAddressController.dispose();
  cCityController.dispose();
  cWhatsappController.dispose();
  cNotsController.dispose();
}

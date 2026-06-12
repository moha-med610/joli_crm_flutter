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
  bool isLoading = false,
}) {
  return bottomSheetWidget(
    context,
    title: "Add New Customer",
    children: [
      Form(
        key: formKey,
        child: Column(
          children: [
            TextFormFieldWidget(
              controller: cNameController,
              hint: "Name",
              validator: AppValidator.name,
            ),
            SizedBox(height: 10),
            TextFormFieldWidget(
              controller: cPhoneController,
              hint: "Phone",
              validator: AppValidator.phone,
            ),
            SizedBox(height: 10),
            TextFormFieldWidget(
              controller: cAddressController,
              hint: "Address",
              validator: AppValidator.address,
            ),
            SizedBox(height: 10),
            TextFormFieldWidget(
              controller: cCityController,
              hint: "City",
              validator: AppValidator.city,
            ),
            SizedBox(height: 10),
            TextFormFieldWidget(
              controller: cWhatsappController,
              hint: "Whatsapp",
            ),
            SizedBox(height: 10),
            TextFormFieldWidget(
              controller: cNotsController,
              hint: "Nots",
              minLines: 5,
              maxLines: 5,
            ),
          ],
        ),
      ),
      SizedBox(height: 30),
      isLoading
          ? CupertinoActivityIndicator()
          : ButtonWidget(
              onPressed: onSubmit,
              child: Text(
                "Add Customer",
                style: Theme.of(context).primaryTextTheme.labelMedium,
              ),
            ),
    ],
  );
}

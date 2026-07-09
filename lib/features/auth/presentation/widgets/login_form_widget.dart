import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joli_crm/core/utils/app_validator.dart';
import 'package:joli_crm/core/widgets/text_form_field_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    super.key,
    this.formKey,
    required this._emailController,
    required this._passwordController,
  });

  final GlobalKey<FormState>? formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormFieldWidget(
            validator: AppValidator.email,
            controller: widget._emailController,
            hint: "email".tr(),
          ),
          SizedBox(height: 10.h),
          TextFormFieldWidget(
            validator: AppValidator.loginPassword,
            controller: widget._passwordController,
            hint: "password".tr(),
            isSecureText: !showPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: showPassword
                  ? const Icon(CupertinoIcons.eye_slash_fill)
                  : const Icon(CupertinoIcons.eye_fill),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/app_validator.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/button_widget.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/core/widgets/text_form_field_widget.dart';
import 'package:joli_crm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:joli_crm/features/auth/presentation/screens/login_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool showOldPassword = false;
  bool showNewPassword = false;
  bool showConfirmPassword = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: AppLayout(
        appBar: AppBarWidget(title: "change_password".tr()),
        bottomNavigationBar: SafeArea(
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is ChangePasswordSuccess) {
                SnackBarWidgets.success(context, state.message);

                context.pushAndRemoveUntil(const LoginScreen());
              }

              if (state is AuthError) {
                SnackBarWidgets.error(context, state.error);
                context.pop();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return ButtonWidget(
                    child: state is AuthLoading
                        ? const CupertinoActivityIndicator(
                            radius: 10,
                            color: Colors.white,
                          )
                        : Text(
                            "change_password".tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        context.read<AuthCubit>().changePassword(
                          oldPassword: _oldPasswordController.text.trim(),
                          newPassword: _newPasswordController.text.trim(),
                          confirmNewPassword: _confirmPasswordController.text
                              .trim(),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
        child: Form(
          key: _key,
          child: Column(
            spacing: 10,
            children: [
              TextFormFieldWidget(
                controller: _oldPasswordController,
                hint: "old_password".tr(),
                validator: AppValidator.loginPassword,
                isSecureText: !showOldPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showOldPassword = !showOldPassword;
                    });
                  },
                  icon: showOldPassword
                      ? const Icon(CupertinoIcons.eye_slash_fill)
                      : const Icon(CupertinoIcons.eye_fill),
                ),
              ),
              TextFormFieldWidget(
                controller: _newPasswordController,
                hint: "new_password".tr(),
                validator: AppValidator.password,
                isSecureText: !showNewPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showNewPassword = !showNewPassword;
                    });
                  },
                  icon: showNewPassword
                      ? const Icon(CupertinoIcons.eye_slash_fill)
                      : const Icon(CupertinoIcons.eye_fill),
                ),
              ),
              TextFormFieldWidget(
                controller: _confirmPasswordController,
                hint: "confirm_new_password".tr(),
                validator: (value) => AppValidator.confirmPassword(
                  value,
                  _newPasswordController.text,
                ),
                isSecureText: !showConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                  icon: showConfirmPassword
                      ? const Icon(CupertinoIcons.eye_slash_fill)
                      : const Icon(CupertinoIcons.eye_fill),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

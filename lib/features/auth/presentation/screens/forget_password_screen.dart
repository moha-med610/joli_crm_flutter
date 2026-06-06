import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/app_validator.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/button_widget.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/core/widgets/text_form_field_widget.dart';
import 'package:joli_crm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:joli_crm/features/auth/presentation/screens/verify_otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: AppLayout(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              SnackBarWidgets.error(context, state.error);
            }

            if (state is AuthSuccess) {
              SnackBarWidgets.success(context, state.data.message);
              context.push(
                VerifyOtpScreen(email: _emailController.text.trim()),
              );
            }
          },
          builder: (context, state) {
            final bool isLoading = state is AuthLoading;
            return Column(
              children: [
                Form(
                  key: _formKey,
                  child: TextFormFieldWidget(
                    validator: AppValidator.email,
                    controller: _emailController,
                    hint: "email".tr(),
                  ),
                ),
                Spacer(),
                ButtonWidget(
                  child: isLoading
                      ? CupertinoActivityIndicator(
                          radius: 10,
                          color: Colors.white,
                        )
                      : Text(
                          "send".tr(),
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().forgetPassword(
                        email: _emailController.text.trim(),
                      );
                    } else {
                      _emailController.clear();
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/app_validator.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:joli_crm/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:joli_crm/features/auth/presentation/widgets/otp_widget.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _otpController.dispose();
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
              context.push(ResetPasswordScreen(email: widget.email));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Form(
                  key: _formKey,
                  child: OtpWidget(
                    controller: _otpController,
                    validator: AppValidator.otp,
                    onComplete: (otp) {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().verifyForgetPasswordOtp(
                          email: widget.email,
                          otp: otp,
                        );
                      } else {
                        _otpController.clear();
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

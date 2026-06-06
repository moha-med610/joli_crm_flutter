import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/button_widget.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:joli_crm/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:joli_crm/features/auth/presentation/widgets/do_not_have_account_widget.dart';
import 'package:joli_crm/features/auth/presentation/widgets/forget_password_widget.dart';
import 'package:joli_crm/features/auth/presentation/widgets/header_widget.dart';
import 'package:joli_crm/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:joli_crm/features/main/presentation/screen/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: AppLayout(
        appBar: null,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              SnackBarWidgets.error(context, state.error);
            }

            if (state is LoginSuccess) {
              SnackBarWidgets.success(context, state.data.message);
              context.push(const MainScreen());
            }
          },

          builder: (context, state) {
            final isLoading = state is AuthLoading;
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: [
                    HeaderWidget(),
                    SizedBox(height: 50.h),
                    LoginFormWidget(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      formKey: _formKey,
                    ),
                    SizedBox(height: 10.h),
                    ForgetPasswordWidget(
                      onTap: () {
                        context.push(ForgetPasswordScreen());
                      },
                    ),
                    SizedBox(height: 20.h),
                    ButtonWidget(
                      child: isLoading
                          ? CupertinoActivityIndicator(
                              radius: 10,
                              color: Colors.white,
                            )
                          : Text(
                              "login".tr(),
                              style: Theme.of(context).textTheme.labelMedium!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                        } else {
                          _emailController.clear();
                          _passwordController.clear();
                        }
                      },
                    ),
                    Spacer(),
                    DoNotHaveAccountWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

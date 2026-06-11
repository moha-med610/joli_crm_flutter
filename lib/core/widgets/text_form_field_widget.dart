import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/logic/app_cubit.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this._controller,
    this.isSecureText = false,
    required this.hint,
    this.cursorColor = Colors.black,
    this.suffixIcon,
    this.validator,
  });

  final TextEditingController _controller;
  final bool isSecureText;
  final Color cursorColor;
  final String hint;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final bool isDark = context.watch<AppCubit>().state.isDark;
          return TextFormField(
            validator: validator,
            controller: _controller,
            obscureText: isSecureText,
            cursorColor: isDark ? Colors.white54 : Colors.black,
            cursorRadius: Radius.circular(10),
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(
                color: isDark ? Colors.white54 : Colors.black,
              ),
              suffixIconColor: isDark ? Colors.white54 : Colors.black,
            ),
            style: TextStyle(color: isDark ? Colors.white70 : Colors.black),
          );
        },
      ),
    );
  }
}

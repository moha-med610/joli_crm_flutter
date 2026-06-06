import 'package:flutter/material.dart';

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
    return TextFormField(
      validator: validator,
      controller: _controller,
      obscureText: isSecureText,
      cursorColor: cursorColor,
      cursorRadius: Radius.circular(10),
      decoration: InputDecoration(hintText: hint, suffixIcon: suffixIcon),
    );
  }
}

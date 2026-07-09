import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    required this._validator,
    required this._controller,
    required this.onComplete,
    this.length = 6,
  });

  final FormFieldValidator<String>? _validator;
  final TextEditingController _controller;
  final ValueChanged<String>? onComplete;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        closeKeyboardWhenCompleted: true,
        animationCurve: Curves.bounceIn,
        validator: _validator,
        controller: _controller,
        keyboardType: TextInputType.number,
        animationDuration: const Duration(milliseconds: 400),
        onCompleted: onComplete,
        length: length,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}

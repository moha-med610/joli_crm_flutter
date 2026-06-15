import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';

class SnackBarWidgets {
  static AlertInfo error(BuildContext context, String error) {
    return AlertInfo.show(
      context: context,
      text: error,
      typeInfo: .error,
      padding: MediaQuery.of(context).size.height * 0.08,
    );
  }

  static AlertInfo success(BuildContext context, String message) {
    return AlertInfo.show(
      context: context,
      text: message,
      typeInfo: .success,
      padding: MediaQuery.of(context).size.height * 0.08,
    );
  }
}

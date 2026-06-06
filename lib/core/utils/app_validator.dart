import 'package:easy_localization/easy_localization.dart';
import 'package:form_validator/form_validator.dart';

class AppValidator {
  AppValidator._();

  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
  );

  static String? email(String? value) {
    return ValidationBuilder()
        .required("email_required".tr())
        .email("invalid_email".tr())
        .build()(value);
  }

  static String? password(String? value) {
    return ValidationBuilder()
        .required("password_required".tr())
        .minLength(8, "invalid_password_min_length".tr())
        .regExp(_passwordRegex, "invalid_password_format".tr())
        .build()(value);
  }

  static String? otp(String? value) {
    return ValidationBuilder().required().minLength(6).maxLength(6).build()(
      value,
    );
  }

  static String? confirmPassword(String? value, String password) {
    final validationResult = ValidationBuilder().required().build()(value);

    if (validationResult != null) {
      return validationResult;
    }

    if (value != password) {
      return "passwords_do_not_match".tr();
    }

    return null;
  }
}

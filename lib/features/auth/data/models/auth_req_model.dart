import 'package:json_annotation/json_annotation.dart';

part 'auth_req_model.g.dart';

@JsonSerializable()
class LoginReqModel {
  final String email;
  final String password;

  LoginReqModel({required this.email, required this.password});

  factory LoginReqModel.fromJson(Map<String, dynamic> json) =>
      _$LoginReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginReqModelToJson(this);
}

@JsonSerializable()
class ForgetPasswordReqModel {
  final String email;

  ForgetPasswordReqModel({required this.email});

  factory ForgetPasswordReqModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordReqModelToJson(this);
}

@JsonSerializable()
class VerifyForgetPasswordOtpReqModel {
  final String email;
  final String otp;

  VerifyForgetPasswordOtpReqModel({required this.email, required this.otp});

  factory VerifyForgetPasswordOtpReqModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyForgetPasswordOtpReqModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VerifyForgetPasswordOtpReqModelToJson(this);
}

@JsonSerializable()
class ResetPasswordReqModel {
  final String email;
  final String newPassword;
  final String confirmNewPassword;

  ResetPasswordReqModel({
    required this.email,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  factory ResetPasswordReqModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordReqModelToJson(this);
}

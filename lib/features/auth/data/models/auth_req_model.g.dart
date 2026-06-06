// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginReqModel _$LoginReqModelFromJson(Map<String, dynamic> json) =>
    LoginReqModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginReqModelToJson(LoginReqModel instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

ForgetPasswordReqModel _$ForgetPasswordReqModelFromJson(
  Map<String, dynamic> json,
) => ForgetPasswordReqModel(email: json['email'] as String);

Map<String, dynamic> _$ForgetPasswordReqModelToJson(
  ForgetPasswordReqModel instance,
) => <String, dynamic>{'email': instance.email};

VerifyForgetPasswordOtpReqModel _$VerifyForgetPasswordOtpReqModelFromJson(
  Map<String, dynamic> json,
) => VerifyForgetPasswordOtpReqModel(
  email: json['email'] as String,
  otp: json['otp'] as String,
);

Map<String, dynamic> _$VerifyForgetPasswordOtpReqModelToJson(
  VerifyForgetPasswordOtpReqModel instance,
) => <String, dynamic>{'email': instance.email, 'otp': instance.otp};

ResetPasswordReqModel _$ResetPasswordReqModelFromJson(
  Map<String, dynamic> json,
) => ResetPasswordReqModel(
  email: json['email'] as String,
  newPassword: json['newPassword'] as String,
  confirmNewPassword: json['confirmNewPassword'] as String,
);

Map<String, dynamic> _$ResetPasswordReqModelToJson(
  ResetPasswordReqModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'newPassword': instance.newPassword,
  'confirmNewPassword': instance.confirmNewPassword,
};

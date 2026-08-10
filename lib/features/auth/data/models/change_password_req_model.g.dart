// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordReqModel _$ChangePasswordReqModelFromJson(
  Map<String, dynamic> json,
) => ChangePasswordReqModel(
  oldPassword: json['currentPassword'] as String,
  newPassword: json['newPassword'] as String,
  confirmNewPassword: json['confirmNewPassword'] as String,
);

Map<String, dynamic> _$ChangePasswordReqModelToJson(
  ChangePasswordReqModel instance,
) => <String, dynamic>{
  'currentPassword': instance.oldPassword,
  'newPassword': instance.newPassword,
  'confirmNewPassword': instance.confirmNewPassword,
};

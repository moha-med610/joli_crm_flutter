// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResModel _$LoginResModelFromJson(Map<String, dynamic> json) =>
    LoginResModel(
      json['msg'] as String,
      json['accessToken'] as String,
      json['refreshToken'] as String,
      UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResModelToJson(LoginResModel instance) =>
    <String, dynamic>{
      'msg': instance.message,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'data': instance.data,
    };

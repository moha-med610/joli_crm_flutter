// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResModel _$UserResModelFromJson(Map<String, dynamic> json) => UserResModel(
  UserModel.fromJson(json['user'] as Map<String, dynamic>),
  json['company'] == null
      ? null
      : CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserResModelToJson(UserResModel instance) =>
    <String, dynamic>{'user': instance.user, 'company': instance.company};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  json['_id'] as String,
  json['fullName'] as String,
  json['email'] as String,
  json['phone'] as String,
  $enumDecode(_$RoleEnumEnumMap, json['role']),
  DateTime.parse(json['createdAt'] as String),
  DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  '_id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
  'phone': instance.phone,
  'role': _$RoleEnumEnumMap[instance.role]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$RoleEnumEnumMap = {RoleEnum.ADMIN: 0, RoleEnum.COMPANY: 1};

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
  json['_id'] as String,
  json['user'] as String,
  json['companyName'] as String,
  json['address'] as String,
  json['city'] as String,
  DateTime.parse(json['createdAt'] as String),
  DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.userId,
      'companyName': instance.companyName,
      'address': instance.address,
      'city': instance.city,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

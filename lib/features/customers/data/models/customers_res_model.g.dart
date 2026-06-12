// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCustomersModel _$AllCustomersModelFromJson(Map<String, dynamic> json) =>
    AllCustomersModel(
      json['msg'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => CustomersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllCustomersModelToJson(AllCustomersModel instance) =>
    <String, dynamic>{'msg': instance.message, 'data': instance.data};

SingleCustomerModel _$SingleCustomerModelFromJson(Map<String, dynamic> json) =>
    SingleCustomerModel(
      json['msg'] as String,
      CreateCustomerResModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleCustomerModelToJson(
  SingleCustomerModel instance,
) => <String, dynamic>{'msg': instance.message, 'data': instance.data};

CustomersModel _$CustomersModelFromJson(Map<String, dynamic> json) =>
    CustomersModel(
      json['_id'] as String,
      json['companyId'] as String,
      json['name'] as String,
      json['phone'] as String,
      json['address'] as String,
      json['city'] as String,
      json['whatsapp'] as String?,
      json['notes'] as String?,
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CustomersModelToJson(CustomersModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'companyId': instance.company,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'whatsapp': instance.whatsapp,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

CompanyDataModel _$CompanyDataModelFromJson(Map<String, dynamic> json) =>
    CompanyDataModel(json['_id'] as String, json['companyName'] as String);

Map<String, dynamic> _$CompanyDataModelToJson(CompanyDataModel instance) =>
    <String, dynamic>{'_id': instance.id, 'companyName': instance.companyName};

CreateCustomerResModel _$CreateCustomerResModelFromJson(
  Map<String, dynamic> json,
) => CreateCustomerResModel(
  json['_id'] as String,
  json['companyId'] as String,
  json['name'] as String,
  json['phone'] as String,
  json['address'] as String,
  json['city'] as String,
  json['whatsapp'] as String?,
  json['notes'] as String?,
  DateTime.parse(json['createdAt'] as String),
  DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CreateCustomerResModelToJson(
  CreateCustomerResModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'companyId': instance.companyId,
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'city': instance.city,
  'whatsapp': instance.whatsapp,
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

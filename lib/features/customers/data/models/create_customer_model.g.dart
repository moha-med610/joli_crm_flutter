// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCustomerModel _$CreateCustomerModelFromJson(Map<String, dynamic> json) =>
    CreateCustomerModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      whatsapp: json['whatsapp'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CreateCustomerModelToJson(
  CreateCustomerModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'city': instance.city,
  'whatsapp': instance.whatsapp,
  'notes': instance.notes,
};

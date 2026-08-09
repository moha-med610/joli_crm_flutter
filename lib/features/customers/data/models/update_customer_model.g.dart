// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCustomerModel _$UpdateCustomerModelFromJson(Map<String, dynamic> json) =>
    UpdateCustomerModel(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      whatsapp: json['whatsapp'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$UpdateCustomerModelToJson(
  UpdateCustomerModel instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'phone': ?instance.phone,
  'address': ?instance.address,
  'city': ?instance.city,
  'whatsapp': ?instance.whatsapp,
  'notes': ?instance.notes,
};

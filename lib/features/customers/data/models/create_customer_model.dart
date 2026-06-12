import 'package:json_annotation/json_annotation.dart';

part 'create_customer_model.g.dart';

@JsonSerializable()
class CreateCustomerModel {
  final String name;
  final String phone;
  final String address;
  final String city;
  final String? whatsapp;
  final String? notes;

  CreateCustomerModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    this.whatsapp,
    this.notes,
  });

  factory CreateCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCustomerModelToJson(this);
}

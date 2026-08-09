import 'package:json_annotation/json_annotation.dart';

part 'update_customer_model.g.dart';

/// Model for partial customer updates - only includes changed fields
@JsonSerializable(includeIfNull: false)
class UpdateCustomerModel {
  final String? name;
  final String? phone;
  final String? address;
  final String? city;
  final String? whatsapp;
  final String? notes;

  UpdateCustomerModel({
    this.name,
    this.phone,
    this.address,
    this.city,
    this.whatsapp,
    this.notes,
  });

  /// Create an UpdateCustomerModel only with fields that have changed
  factory UpdateCustomerModel.fromChanges({
    required String oldName,
    required String newName,
    required String oldPhone,
    required String newPhone,
    required String oldAddress,
    required String newAddress,
    required String oldCity,
    required String newCity,
    required String? oldWhatsapp,
    required String? newWhatsapp,
    required String? oldNotes,
    required String? newNotes,
  }) {
    return UpdateCustomerModel(
      name: oldName != newName ? newName : null,
      phone: oldPhone != newPhone ? newPhone : null,
      address: oldAddress != newAddress ? newAddress : null,
      city: oldCity != newCity ? newCity : null,
      whatsapp: oldWhatsapp != newWhatsapp ? newWhatsapp : null,
      notes: oldNotes != newNotes ? newNotes : null,
    );
  }

  factory UpdateCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCustomerModelToJson(this);
}

import 'package:joli_crm/features/customers/domain/entities/customers_res_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customers_res_model.g.dart';

@JsonSerializable()
class AllCustomersModel {
  @JsonKey(name: "msg")
  final String message;
  final List<CustomersModel> data;

  AllCustomersModel(this.message, this.data);

  factory AllCustomersModel.fromJson(Map<String, dynamic> json) =>
      _$AllCustomersModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCustomersModelToJson(this);

  AllCustomers toEntity() =>
      AllCustomers(message, data.map((i) => i.toEntity()).toList());
}

@JsonSerializable()
class SingleCustomerModel {
  @JsonKey(name: "msg")
  final String message;
  final CustomersModel? data;

  SingleCustomerModel(this.message, this.data);

  factory SingleCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$SingleCustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$SingleCustomerModelToJson(this);

  SingleCustomer toEntity() => SingleCustomer(message, data?.toEntity());
}

@JsonSerializable()
class CustomersModel {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "companyId")
  final CompanyDataModel company;
  final String name;
  final String phone;
  final String address;
  final String city;
  final String? whatsapp;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  CustomersModel(
    this.id,
    this.company,
    this.name,
    this.phone,
    this.address,
    this.city,
    this.whatsapp,
    this.notes,
    this.createdAt,
    this.updatedAt,
  );

  factory CustomersModel.fromJson(Map<String, dynamic> json) =>
      _$CustomersModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomersModelToJson(this);

  Customers toEntity() => Customers(
    id,
    company.toEntity(),
    name,
    phone,
    address,
    city,
    whatsapp,
    notes,
    createdAt,
    updatedAt,
  );
}

@JsonSerializable()
class CompanyDataModel {
  @JsonKey(name: "_id")
  final String id;
  final String companyName;

  CompanyDataModel(this.id, this.companyName);

  factory CompanyDataModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDataModelToJson(this);

  CompanyData toEntity() => CompanyData(id, companyName);
}

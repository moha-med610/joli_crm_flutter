import 'package:joli_crm/features/products/data/models/product_model.dart';
import 'package:joli_crm/features/products/domain/entities/create_product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_product_model.g.dart';

@JsonSerializable()
class CreateProductModel {
  @JsonKey(name: "msg")
  final String message;
  final CreateProductDataModel data;

  CreateProductModel({required this.message, required this.data});

  factory CreateProductModel.fromJson(Map<String, dynamic> json) =>
      _$CreateProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductModelToJson(this);

  CreateProductEntity toEntity() =>
      CreateProductEntity(message: message, data: data.product.toEntity());
}

@JsonSerializable()
class CreateProductDataModel {
  final ProductModel product;

  CreateProductDataModel(this.product);

  factory CreateProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$CreateProductDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductDataModelToJson(this);
}

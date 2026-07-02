import 'package:joli_crm/features/products/data/models/product_model.dart';
import 'package:joli_crm/features/products/domain/entities/get_all_products_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_products_model.g.dart';

@JsonSerializable()
class GetAllProductsModel {
  @JsonKey(name: "msg")
  final String message;
  final ProductsDataModel data;

  GetAllProductsModel({required this.message, required this.data});

  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsModelToJson(this);

  GetAllProductsEntity toEntity() => GetAllProductsEntity(
    message: message,
    data: data.products.map((e) => e.toEntity()).toList(),
  );
}

@JsonSerializable()
class ProductsDataModel {
  final List<ProductModel> products;

  ProductsDataModel(this.products);

  factory ProductsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDataModelToJson(this);
}

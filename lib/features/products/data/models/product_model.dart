import 'package:joli_crm/features/products/data/models/category_model.dart';
import 'package:joli_crm/features/products/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "_id")
  final String id;
  final String companyId;
  @JsonKey(name: "categoryId")
  final CategoryModel category;
  @JsonKey(name: "imageUrl")
  final String productImage;
  final String productName;
  final double productPrice;
  final String productDescription;
  final String productSize;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.companyId,
    required this.category,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productSize,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity() => ProductEntity(
    id: id,
    companyId: companyId,
    category: category.toEntity(),
    productName: productName,
    productPrice: productPrice,
    productDescription: productDescription,
    productSize: productSize,
    createdAt: createdAt,
    updatedAt: updatedAt,
    productImage: productImage,
  );
}

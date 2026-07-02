// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: json['_id'] as String,
  companyId: json['companyId'] as String,
  category: CategoryModel.fromJson(json['categoryId'] as Map<String, dynamic>),
  productImage: json['imageUrl'] as String,
  productName: json['productName'] as String,
  productPrice: (json['productPrice'] as num).toDouble(),
  productDescription: json['productDescription'] as String,
  productSize: json['productSize'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'companyId': instance.companyId,
      'categoryId': instance.category,
      'imageUrl': instance.productImage,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productDescription': instance.productDescription,
      'productSize': instance.productSize,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductModel _$CreateProductModelFromJson(Map<String, dynamic> json) =>
    CreateProductModel(
      message: json['msg'] as String,
      data: CreateProductDataModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CreateProductModelToJson(CreateProductModel instance) =>
    <String, dynamic>{'msg': instance.message, 'data': instance.data};

CreateProductDataModel _$CreateProductDataModelFromJson(
  Map<String, dynamic> json,
) => CreateProductDataModel(
  ProductModel.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateProductDataModelToJson(
  CreateProductDataModel instance,
) => <String, dynamic>{'product': instance.product};

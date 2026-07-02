// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductsModel _$GetAllProductsModelFromJson(Map<String, dynamic> json) =>
    GetAllProductsModel(
      message: json['msg'] as String,
      data: ProductsDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllProductsModelToJson(
  GetAllProductsModel instance,
) => <String, dynamic>{'msg': instance.message, 'data': instance.data};

ProductsDataModel _$ProductsDataModelFromJson(Map<String, dynamic> json) =>
    ProductsDataModel(
      (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsDataModelToJson(ProductsDataModel instance) =>
    <String, dynamic>{'products': instance.products};

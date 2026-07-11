import 'package:joli_crm/features/products/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_product_model.g.dart';

@JsonSerializable()
class UpdateProductModel {
  final ProductModel product;

  UpdateProductModel(this.product);

  factory UpdateProductModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductModelToJson(this);
}

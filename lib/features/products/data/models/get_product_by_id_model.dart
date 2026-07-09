import 'package:joli_crm/features/products/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_product_by_id_model.g.dart';

@JsonSerializable()
class GetProductByIdModel {
  final ProductModel product;

  GetProductByIdModel(this.product);

  factory GetProductByIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetProductByIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductByIdModelToJson(this);
}

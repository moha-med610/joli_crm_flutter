import 'package:joli_crm/features/products/domain/entities/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: "_id")
  final String id;
  final String categoryName;

  CategoryModel({required this.id, required this.categoryName});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  CategoryEntity toEntity() =>
      CategoryEntity(id: id, categoryName: categoryName);
}

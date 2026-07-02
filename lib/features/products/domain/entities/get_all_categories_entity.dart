import 'package:joli_crm/features/products/domain/entities/categories_entity.dart';

class GetAllCategoriesEntity {
  final String message;
  final List<CategoriesEntity> data;

  GetAllCategoriesEntity({required this.message, required this.data});
}

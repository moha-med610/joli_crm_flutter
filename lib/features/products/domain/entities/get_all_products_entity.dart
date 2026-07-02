import 'package:joli_crm/features/products/domain/entities/product_entity.dart';

class GetAllProductsEntity {
  final String message;
  final List<ProductEntity> data;

  GetAllProductsEntity({required this.message, required this.data});
}

import 'package:joli_crm/features/products/domain/entities/product_entity.dart';

class CreateProductEntity {
  final String message;
  final ProductEntity data;

  CreateProductEntity({required this.message, required this.data});
}

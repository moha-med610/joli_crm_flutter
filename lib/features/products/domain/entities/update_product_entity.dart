import 'package:joli_crm/features/products/domain/entities/product_entity.dart';

class UpdateProductEntity {
  final String message;
  final ProductEntity data;

  UpdateProductEntity({required this.message, required this.data});
}

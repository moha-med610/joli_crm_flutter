import 'package:joli_crm/features/products/domain/entities/product_entity.dart';

class GetProductByIdEntity {
  final String message;
  final ProductEntity data;

  GetProductByIdEntity({required this.message, required this.data});
}

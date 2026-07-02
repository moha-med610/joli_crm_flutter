import 'package:joli_crm/features/products/domain/entities/category_entity.dart';

class ProductEntity {
  final String id;
  final String companyId;
  final String productImage;
  final CategoryEntity category;
  final String productName;
  final double productPrice;
  final String productDescription;
  final String productSize;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductEntity({
    required this.id,
    required this.companyId,
    required this.productImage,
    required this.category,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productSize,
    required this.createdAt,
    required this.updatedAt,
  });
}

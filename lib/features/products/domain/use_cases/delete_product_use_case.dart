import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/products/domain/entities/delete_product_entity.dart';
import 'package:joli_crm/features/products/domain/repos/base_products_repo.dart';

class DeleteProductUseCase {
  final BaseProductsRepo repo;

  DeleteProductUseCase(this.repo);

  Future<Either<Failure, DeleteProductEntity>> call(String id) {
    return repo.deleteProduct(id);
  }
}

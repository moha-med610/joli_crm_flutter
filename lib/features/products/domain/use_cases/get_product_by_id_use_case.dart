import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/products/domain/entities/get_product_by_id_entity.dart';
import 'package:joli_crm/features/products/domain/repos/base_products_repo.dart';

class GetProductByIdUseCase {
  final BaseProductsRepo repo;

  GetProductByIdUseCase(this.repo);

  Future<Either<Failure, GetProductByIdEntity>> call(String id) async {
    return await repo.getProductById(id);
  }
}

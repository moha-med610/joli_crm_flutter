import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/products/domain/entities/get_all_products_entity.dart';
import 'package:joli_crm/features/products/domain/repos/base_products_repo.dart';

class GetAllProductsUseCase {
  final BaseProductsRepo repo;

  GetAllProductsUseCase(this.repo);

  Future<Either<Failure, GetAllProductsEntity>> call(int page, int limit) {
    return repo.getAllProducts(page, limit);
  }
}

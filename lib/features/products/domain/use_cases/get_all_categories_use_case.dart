import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/products/domain/entities/category_entity.dart';
import 'package:joli_crm/features/products/domain/repos/base_products_repo.dart';

class GetAllCategoriesUseCase {
  final BaseProductsRepo repo;

  GetAllCategoriesUseCase(this.repo);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await repo.getAllCategories();
  }
}

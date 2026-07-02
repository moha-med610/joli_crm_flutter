import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/products/data/models/products_req_model.dart';
import 'package:joli_crm/features/products/domain/entities/create_product_entity.dart';
import 'package:joli_crm/features/products/domain/repos/base_products_repo.dart';

class CreateProductUseCase {
  final BaseProductsRepo repo;

  CreateProductUseCase(this.repo);

  Future<Either<Failure, CreateProductEntity>> call(
    ProductsReqModel req,
  ) async {
    return await repo.createProduct(req);
  }
}

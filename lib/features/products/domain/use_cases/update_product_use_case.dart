import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/products/data/models/update_product_req_model.dart';
import 'package:joli_crm/features/products/domain/entities/update_product_entity.dart';
import 'package:joli_crm/features/products/domain/repos/base_products_repo.dart';

class UpdateProductUseCase {
  final BaseProductsRepo repo;

  UpdateProductUseCase(this.repo);

  Future<Either<Failure, UpdateProductEntity>> call({
    required String id,
    required UpdateProductReqModel data,
  }) async {
    return repo.updateProduct(id, data);
  }
}

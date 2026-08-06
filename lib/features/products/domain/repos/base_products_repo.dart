import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/products/data/models/products_req_model.dart';
import 'package:joli_crm/features/products/data/models/update_product_req_model.dart';
import 'package:joli_crm/features/products/domain/entities/category_entity.dart';
import 'package:joli_crm/features/products/domain/entities/create_product_entity.dart';
import 'package:joli_crm/features/products/domain/entities/delete_product_entity.dart';
import 'package:joli_crm/features/products/domain/entities/get_all_products_entity.dart';
import 'package:joli_crm/features/products/domain/entities/get_product_by_id_entity.dart';
import 'package:joli_crm/features/products/domain/entities/update_product_entity.dart';

abstract class BaseProductsRepo {
  Future<Either<Failure, GetAllProductsEntity>> getAllProducts(
    int page,
    int limit,
  );

  Future<Either<Failure, CreateProductEntity>> createProduct(
    ProductsReqModel req,
  );

  Future<Either<Failure, GetProductByIdEntity>> getProductById(String id);

  Future<Either<Failure, UpdateProductEntity>> updateProduct(
    String id,
    UpdateProductReqModel data,
  );

  Future<Either<Failure, DeleteProductEntity>> deleteProduct(String id);

  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
}

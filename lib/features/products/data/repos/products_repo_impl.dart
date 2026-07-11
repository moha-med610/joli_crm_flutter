import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:joli_crm/core/errors/error_handler.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/core/utils/build_image.dart';
import 'package:joli_crm/features/products/data/data_source/base_products_data_source.dart';
import 'package:joli_crm/features/products/data/models/products_req_model.dart';
import 'package:joli_crm/features/products/data/models/update_product_req_model.dart';
import 'package:joli_crm/features/products/domain/entities/create_product_entity.dart';
import 'package:joli_crm/features/products/domain/entities/delete_product_entity.dart';
import 'package:joli_crm/features/products/domain/entities/get_all_products_entity.dart';
import 'package:joli_crm/features/products/domain/entities/get_product_by_id_entity.dart';
import 'package:joli_crm/features/products/domain/entities/update_product_entity.dart';
import 'package:joli_crm/features/products/domain/repos/base_products_repo.dart';

class ProductsRepoImpl implements BaseProductsRepo {
  final BaseProductsDataSource _productsDataSource;

  ProductsRepoImpl(this._productsDataSource);

  @override
  Future<Either<Failure, CreateProductEntity>> createProduct(
    ProductsReqModel req,
  ) async {
    try {
      final res = await _productsDataSource.createProduct(
        req.productName,
        req.productDescription,
        req.productPrice,
        req.productSize,
        await buildImage(req.productImage.path),
        req.categoryId,
      );

      return Right(res.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await _productsDataSource.createProduct(
          req.productName,
          req.productDescription,
          req.productPrice,
          req.productSize,
          await buildImage(req.productImage.path),
          req.categoryId,
        );
      }
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, GetAllProductsEntity>> getAllProducts(
    int page,
    int limit,
  ) async {
    try {
      final res = await _productsDataSource.getAllProducts(page, limit);

      return Right(res.toEntity());
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, GetProductByIdEntity>> getProductById(
    String id,
  ) async {
    try {
      final res = await _productsDataSource.getProductById(id);

      return Right(
        GetProductByIdEntity(
          message: res.message,
          data: res.data.product.toEntity(),
        ),
      );
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, UpdateProductEntity>> updateProduct(
    String id,
    UpdateProductReqModel data,
  ) async {
    try {
      final res = await _productsDataSource.updateProduct(id, data);

      return Right(
        UpdateProductEntity(
          message: res.message,
          data: res.data.product.toEntity(),
        ),
      );
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, DeleteProductEntity>> deleteProduct(String id) async {
    try {
      final res = await _productsDataSource.deleteProduct(id);

      return Right(
        DeleteProductEntity(message: res.message, data: res.data.toJson()),
      );
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:joli_crm/core/errors/error_handler.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/customers/data/data_source/customers_data_source.dart';
import 'package:joli_crm/features/customers/data/models/create_customer_model.dart';
import 'package:joli_crm/features/customers/domain/entities/customers_res_entity.dart';
import 'package:joli_crm/features/customers/domain/repo/base_customer_repo.dart';

class CustomerRepoImpl implements BaseCustomerRepo {
  final CustomersDataSource dataSource;

  CustomerRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, AllCustomers>> getAllCustomers({
    required int page,
    required int limit,
  }) async {
    try {
      final res = await dataSource.getAllCustomers(page, limit);

      return Right(res.toEntity());
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SingleCustomer>> createCustomer(
    CreateCustomerModel data,
  ) async {
    try {
      final res = await dataSource.createCustomer(data);

      return Right(res.toEntity());
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SingleCustomer>> getCustomerById({
    required String customerId,
  }) async {
    try {
      final res = await dataSource.getCustomerById(customerId);

      print(res);

      return Right(res.toEntity());
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SingleCustomer>> updateCustomer({
    required String customerId,
    required CreateCustomerModel data,
  }) async {
    try {
      final res = await dataSource.updateCustomer(customerId, data);

      return Right(res.toEntity());
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, DeleteCustomer>> deleteCustomer({
    required String customerId,
  }) async {
    try {
      final res = await dataSource.deleteCustomer(customerId);

      return Right(res.toEntity());
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }
}

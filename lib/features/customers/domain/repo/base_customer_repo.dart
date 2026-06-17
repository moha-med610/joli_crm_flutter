import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/customers/data/models/create_customer_model.dart';
import 'package:joli_crm/features/customers/domain/entities/customers_res_entity.dart';

abstract class BaseCustomerRepo {
  Future<Either<Failure, AllCustomers>> getAllCustomers({
    required int page,
    required int limit,
  });

  Future<Either<Failure, SingleCustomer>> createCustomer(
    CreateCustomerModel data,
  );

  Future<Either<Failure, SingleCustomer>> getCustomerById({
    required String customerId,
  });

  Future<Either<Failure, SingleCustomer>> updateCustomer({
    required String customerId,
    required CreateCustomerModel data,
  });

  Future<Either<Failure, DeleteCustomer>> deleteCustomer({
    required String customerId,
  });
}

import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/customers/domain/entities/customers_res_entity.dart';

abstract class BaseCustomerRepo {
  Future<Either<Failure, AllCustomers>> getAllCustomers();
}

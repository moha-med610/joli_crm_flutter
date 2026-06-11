import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/customers/domain/entities/customers_res_entity.dart';
import 'package:joli_crm/features/customers/domain/repo/base_customer_repo.dart';

class GetAllCustomersUseCase {
  final BaseCustomerRepo repo;

  GetAllCustomersUseCase(this.repo);

  Future<Either<Failure, AllCustomers>> call() {
    return repo.getAllCustomers();
  }
}

import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/customers/domain/entities/customers_res_entity.dart';
import 'package:joli_crm/features/customers/domain/repo/base_customer_repo.dart';

class DeleteCustomerUseCase {
  final BaseCustomerRepo repo;

  DeleteCustomerUseCase(this.repo);

  Future<Either<Failure, DeleteCustomer>> call({required String customerId}) {
    return repo.deleteCustomer(customerId: customerId);
  }
}

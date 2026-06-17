import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/customers/domain/entities/customers_res_entity.dart';
import 'package:joli_crm/features/customers/domain/repo/base_customer_repo.dart';

class GetCustomerByIdUseCase {
  final BaseCustomerRepo repo;

  GetCustomerByIdUseCase(this.repo);

  Future<Either<Failure, SingleCustomer>> call({
    required String customerId,
  }) async {
    return repo.getCustomerById(customerId: customerId);
  }
}

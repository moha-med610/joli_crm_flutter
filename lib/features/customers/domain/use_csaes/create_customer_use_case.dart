import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/customers/data/models/create_customer_model.dart';
import 'package:joli_crm/features/customers/domain/entities/customers_res_entity.dart';
import 'package:joli_crm/features/customers/domain/repo/base_customer_repo.dart';

class CreateCustomerUseCase {
  final BaseCustomerRepo repo;

  CreateCustomerUseCase(this.repo);

  Future<Either<Failure, SingleCustomer>> call(CreateCustomerModel data) {
    return repo.createCustomer(data);
  }
}

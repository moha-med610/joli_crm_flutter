import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/auth/domain/entities/auth_res_entity.dart';
import 'package:joli_crm/features/auth/domain/repos/base_auth_repo.dart';

class LogoutUseCase {
  final BaseAuthRepo repo;

  LogoutUseCase(this.repo);

  Future<Either<Failure, AuthResEntity>> call() {
    return repo.logout();
  }
}

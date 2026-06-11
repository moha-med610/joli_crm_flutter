import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/auth/domain/entities/user_entity.dart';
import 'package:joli_crm/features/auth/domain/repos/base_auth_repo.dart';

class ProfileUseCase {
  final BaseAuthRepo repo;

  ProfileUseCase(this.repo);

  Future<Either<Failure, UserResEntity>> call() {
    return repo.profile();
  }
}

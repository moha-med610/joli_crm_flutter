import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/auth/data/models/auth_req_model.dart';
import 'package:joli_crm/features/auth/domain/entities/auth_res_entity.dart';
import 'package:joli_crm/features/auth/domain/repos/base_auth_repo.dart';

class ResetPasswordUseCase {
  final BaseAuthRepo repo;

  ResetPasswordUseCase(this.repo);

  Future<Either<Failure, AuthResEntity>> call(ResetPasswordReqModel data) {
    return repo.resetPassword(data);
  }
}

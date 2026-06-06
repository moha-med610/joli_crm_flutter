import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/auth/data/models/auth_req_model.dart';
import 'package:joli_crm/features/auth/domain/entities/auth_res_entity.dart';
import 'package:joli_crm/features/auth/domain/repos/base_auth_repo.dart';

class ForgetPasswordUseCase {
  final BaseAuthRepo repo;

  ForgetPasswordUseCase(this.repo);

  Future<Either<Failure, AuthResEntity>> call(ForgetPasswordReqModel data) {
    return repo.forgetPassword(data);
  }
}

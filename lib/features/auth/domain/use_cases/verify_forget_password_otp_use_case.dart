import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/auth/data/models/auth_req_model.dart';
import 'package:joli_crm/features/auth/domain/entities/auth_res_entity.dart';
import 'package:joli_crm/features/auth/domain/repos/base_auth_repo.dart';

class VerifyForgetPasswordOtpUseCase {
  final BaseAuthRepo repo;

  VerifyForgetPasswordOtpUseCase(this.repo);

  Future<Either<Failure, AuthResEntity>> call(
    VerifyForgetPasswordOtpReqModel data,
  ) {
    return repo.verifyOtpForgetPassword(data);
  }
}

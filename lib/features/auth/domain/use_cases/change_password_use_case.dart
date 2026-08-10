import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/core/models/api_response_model.dart';
import 'package:joli_crm/features/auth/data/models/change_password_req_model.dart';
import 'package:joli_crm/features/auth/domain/repos/base_auth_repo.dart';

class ChangePasswordUseCase {
  final BaseAuthRepo repo;

  ChangePasswordUseCase(this.repo);

  Future<Either<Failure, ApiResponseModel>> call(
    ChangePasswordReqModel data,
  ) async {
    return await repo.changePassword(data);
  }
}

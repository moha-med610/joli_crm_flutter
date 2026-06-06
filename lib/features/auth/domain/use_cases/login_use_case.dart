import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/auth/data/models/auth_req_model.dart';
import 'package:joli_crm/features/auth/domain/entities/login_res_entity.dart';
import 'package:joli_crm/features/auth/domain/repos/base_auth_repo.dart';

class LoginUseCase {
  final BaseAuthRepo repo;

  LoginUseCase(this.repo);

  Future<Either<Failure, LoginResEntity>> call(LoginReqModel data) {
    return repo.login(data);
  }
}

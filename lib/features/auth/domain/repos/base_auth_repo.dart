import 'package:dartz/dartz.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/auth/data/models/auth_req_model.dart';
import 'package:joli_crm/features/auth/data/models/auth_res_model.dart';
import 'package:joli_crm/features/auth/domain/entities/auth_res_entity.dart';
import 'package:joli_crm/features/auth/domain/entities/login_res_entity.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure, LoginResEntity>> login(LoginReqModel data);

  Future<Either<Failure, AuthResEntity>> forgetPassword(
    ForgetPasswordReqModel data,
  );

  Future<Either<Failure, AuthResEntity>> verifyOtpForgetPassword(
    VerifyForgetPasswordOtpReqModel data,
  );

  Future<Either<Failure, AuthResEntity>> resetPassword(
    ResetPasswordReqModel data,
  );

  Future<Either<Failure, AuthResModel>> logout();

  // Future<Either<Failure, >>> profile();
}

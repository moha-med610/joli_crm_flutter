import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:joli_crm/core/constants/storage_keys.dart';
import 'package:joli_crm/core/errors/error_handler.dart';
import 'package:joli_crm/core/errors/failure.dart';
import 'package:joli_crm/features/auth/data/data_source/base_auth_data_source.dart';
import 'package:joli_crm/features/auth/data/models/auth_req_model.dart';
import 'package:joli_crm/features/auth/data/models/auth_res_model.dart';
import 'package:joli_crm/features/auth/domain/entities/auth_res_entity.dart';
import 'package:joli_crm/features/auth/domain/entities/login_res_entity.dart';
import 'package:joli_crm/features/auth/domain/repos/base_auth_repo.dart';
import 'package:joli_crm/main.dart';

class AuthRepoImpl implements BaseAuthRepo {
  final BaseAuthDataSource dataSource;

  AuthRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, LoginResEntity>> login(LoginReqModel data) async {
    try {
      final res = await dataSource.login(data);

      await secureStorage.write(
        key: StorageKeys.accessToken,
        value: res.accessToken,
      );
      await secureStorage.write(
        key: StorageKeys.refreshToken,
        value: res.refreshToken,
      );
      return Right(res);
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, AuthResEntity>> forgetPassword(
    ForgetPasswordReqModel data,
  ) async {
    try {
      final res = await dataSource.forgetPassword(data);

      return Right(res);
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, AuthResEntity>> verifyOtpForgetPassword(
    VerifyForgetPasswordOtpReqModel data,
  ) async {
    try {
      final res = await dataSource.verifyForgetPasswordOtp(data);

      return Right(res);
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, AuthResEntity>> resetPassword(
    ResetPasswordReqModel data,
  ) async {
    try {
      final res = await dataSource.resetPassword(data);

      return Right(res);
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, AuthResModel>> logout() async {
    try {
      final res = await dataSource.logout();

      secureStorage.delete(key: StorageKeys.accessToken);
      secureStorage.delete(key: StorageKeys.refreshToken);

      return Right(res);
    } on DioException catch (e) {
      return Left(DioErrorHandler.handle(e));
    }
  }
}

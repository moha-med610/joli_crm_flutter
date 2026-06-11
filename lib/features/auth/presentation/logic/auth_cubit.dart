import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:joli_crm/features/auth/data/models/auth_req_model.dart';
import 'package:joli_crm/features/auth/domain/entities/auth_res_entity.dart';
import 'package:joli_crm/features/auth/domain/entities/login_res_entity.dart';
import 'package:joli_crm/features/auth/domain/entities/user_entity.dart';
import 'package:joli_crm/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:joli_crm/features/auth/domain/use_cases/login_use_case.dart';
import 'package:joli_crm/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:joli_crm/features/auth/domain/use_cases/profile_use_case.dart';
import 'package:joli_crm/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:joli_crm/features/auth/domain/use_cases/verify_forget_password_otp_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final VerifyForgetPasswordOtpUseCase verifyForgetPasswordOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final LogoutUseCase logoutUseCase;
  final ProfileUseCase profileUseCase;

  AuthCubit(
    this.loginUseCase,
    this.forgetPasswordUseCase,
    this.verifyForgetPasswordOtpUseCase,
    this.resetPasswordUseCase,
    this.logoutUseCase,
    this.profileUseCase,
  ) : super(AuthInitial());

  bool _isLoading = false;
  UserEntity? currentUser;

  Future<void> login({required String email, required String password}) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(AuthLoading());

    final result = await loginUseCase(
      LoginReqModel(email: email, password: password),
    );

    result.fold(
      (err) {
        emit(AuthError(err.message));
      },
      (data) {
        currentUser = data.data;
        emit(LoginSuccess(data));
      },
    );

    _isLoading = false;
  }

  Future<void> forgetPassword({required String email}) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(AuthLoading());

    final result = await forgetPasswordUseCase(
      ForgetPasswordReqModel(email: email),
    );

    result.fold(
      (err) {
        emit(AuthError(err.message));
      },
      (data) {
        emit(AuthSuccess(data));
      },
    );

    _isLoading = false;
  }

  Future<void> verifyForgetPasswordOtp({
    required String email,
    required String otp,
  }) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(AuthLoading());

    final result = await verifyForgetPasswordOtpUseCase(
      VerifyForgetPasswordOtpReqModel(email: email, otp: otp),
    );

    result.fold(
      (err) => emit(AuthError(err.message)),
      (data) => emit(AuthSuccess(data)),
    );
    _isLoading = false;
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(AuthLoading());

    final result = await resetPasswordUseCase(
      ResetPasswordReqModel(
        email: email,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
      ),
    );

    result.fold(
      (err) => emit(AuthError(err.message)),
      (data) => emit(AuthSuccess(data)),
    );

    _isLoading = false;
  }

  Future<void> logout() async {
    if (_isLoading) return;

    _isLoading = true;
    emit(AuthLoading());

    final result = await logoutUseCase();

    result.fold(
      (err) => emit(AuthError(err.message)),
      (data) => emit(AuthSuccess(data)),
    );

    _isLoading = false;
  }

  Future<void> profile() async {
    emit(AuthLoading());

    final result = await profileUseCase();

    result.fold((err) => emit(AuthError(err.message)), (data) {
      currentUser = data.user;
      emit(UserSuccess(data));
    });
  }
}

part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginResEntity data;

  LoginSuccess(this.data);
}

class AuthSuccess extends AuthState {
  final AuthResEntity data;

  AuthSuccess(this.data);
}

final class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}

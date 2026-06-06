part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashLoading extends SplashState {}

final class SplashAuthenticated extends SplashState {}

final class SplashUnAuthenticated extends SplashState {}

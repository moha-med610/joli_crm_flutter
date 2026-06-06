class LoginResEntity {
  final String message;
  final String accessToken;
  final String refreshToken;

  LoginResEntity({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });
}

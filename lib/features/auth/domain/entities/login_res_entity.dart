import 'package:joli_crm/features/auth/domain/entities/user_entity.dart';

class LoginResEntity {
  final String message;
  final String accessToken;
  final String refreshToken;
  final UserEntity data;

  LoginResEntity({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
    required this.data,
  });
}

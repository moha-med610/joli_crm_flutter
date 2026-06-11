// lib/core/utils/jwt_helper.dart
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class JwtHelper {
  static Map<String, dynamic> decode(String token) {
    final jwt = JWT.decode(token);
    return jwt.payload as Map<String, dynamic>;
  }
}

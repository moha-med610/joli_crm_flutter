import 'package:dio/dio.dart';
import 'package:joli_crm/core/constants/api_constants.dart';
import 'package:joli_crm/core/network/interceptors/auth_interceptor.dart';
import 'package:joli_crm/core/network/interceptors/logger_interceptor.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        sendTimeout: Duration(seconds: 60),
        headers: {"Content-Type": "application/json"},
      ),
    );

    dio.interceptors.addAll([AuthInterceptor(), LoggerInterceptor()]);
  }
}

import 'package:dio/dio.dart';
import 'package:joli_crm/core/errors/error_model.dart';
import 'package:joli_crm/core/errors/failure.dart';

class DioErrorHandler {
  static Failure handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout, please try again.');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Request timeout, please try again.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Server took too long to respond.');

      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection.');

      case DioExceptionType.badCertificate:
        return ServerFailure('Security certificate error.');

      case DioExceptionType.cancel:
        return ServerFailure('Request cancelled.');

      case DioExceptionType.badResponse:
        return _handleResponse(error);

      default:
        return ServerFailure('Unexpected error occurred.');
    }
  }

  static Failure _handleResponse(DioException error) {
    final data = error.response?.data;

    try {
      if (data is Map<String, dynamic>) {
        final errorModel = ErrorModel.fromJson(data);
        return ServerFailure(
          errorModel.firstError.isNotEmpty
              ? errorModel.firstError
              : errorModel.message,
        );
      }

      if (data is String) {
        return ServerFailure(data);
      }

      return ServerFailure('Server error');
    } catch (_) {
      return ServerFailure('Server error');
    }
  }
}

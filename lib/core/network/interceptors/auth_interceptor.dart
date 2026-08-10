import 'package:dio/dio.dart';
import 'package:joli_crm/core/constants/api_constants.dart';
import 'package:joli_crm/core/constants/storage_keys.dart';
import 'package:joli_crm/core/network/dio/dio_client.dart';
import 'package:joli_crm/main.dart';

class AuthInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final refreshToken = await secureStorage.read(
      key: StorageKeys.refreshToken,
    );

    final is401 = err.response?.statusCode == 401;

    if (is401 && refreshToken != null) {
      try {
        final res = await DioClient().dio.post(
          ApiConstants.refreshToken,
          data: {"refreshToken": refreshToken},
        );

        if (res.statusCode == 401) {
          await secureStorage.delete(key: StorageKeys.accessToken);
          await secureStorage.delete(key: StorageKeys.refreshToken);
          prefs.remove(key: StorageKeys.role);
          return handler.next(err);
        }

        final newAccessToken = res.data["accessToken"];
        final newRefreshToken = res.data["refreshToken"];

        await secureStorage.write(
          key: StorageKeys.accessToken,
          value: newAccessToken,
        );

        await secureStorage.write(
          key: StorageKeys.refreshToken,
          value: newRefreshToken,
        );

        final requestOptions = err.requestOptions;

        requestOptions.headers["Authorization"] = newAccessToken;

        if (requestOptions.data is FormData) {
          return handler.next(err);
        }

        final response = await DioClient().dio.fetch(requestOptions);

        return handler.resolve(response);
      } catch (e) {
        await secureStorage.delete(key: StorageKeys.accessToken);
        await secureStorage.delete(key: StorageKeys.refreshToken);
        prefs.remove(key: StorageKeys.role);

        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await secureStorage.read(key: StorageKeys.accessToken);

    if (accessToken != null) {
      options.headers["Authorization"] = accessToken;
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }
}

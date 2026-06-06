import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:joli_crm/core/network/dio/dio_client.dart';
import 'package:joli_crm/features/auth/auth_di.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    sl.registerLazySingleton<Dio>(() => DioClient().dio);

    await AuthDi.init();
  }
}

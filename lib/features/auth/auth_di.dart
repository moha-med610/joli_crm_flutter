import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/features/auth/data/data_source/base_auth_data_source.dart';
import 'package:joli_crm/features/auth/data/repos/auth_repo_impl.dart';
import 'package:joli_crm/features/auth/domain/repos/base_auth_repo.dart';
import 'package:joli_crm/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:joli_crm/features/auth/domain/use_cases/login_use_case.dart';
import 'package:joli_crm/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:joli_crm/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:joli_crm/features/auth/domain/use_cases/verify_forget_password_otp_use_case.dart';
import 'package:joli_crm/features/auth/presentation/logic/auth_cubit.dart';

class AuthDi {
  static Future<void> init() async {
    // DataSource
    sl.registerLazySingleton(() => BaseAuthDataSource(sl()));

    // Repo
    sl.registerLazySingleton<BaseAuthRepo>(() => AuthRepoImpl(sl()));

    // UseCase
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => VerifyForgetPasswordOtpUseCase(sl()));
    sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
    sl.registerLazySingleton(() => LogoutUseCase(sl()));

    // Cubit
    sl.registerFactory(() => AuthCubit(sl(), sl(), sl(), sl(), sl()));
  }
}

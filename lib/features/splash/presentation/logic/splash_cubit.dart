import 'package:bloc/bloc.dart';
import 'package:joli_crm/core/constants/storage_keys.dart';
import 'package:joli_crm/main.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkAuth() async {
    emit(SplashLoading());
    await Future.delayed(Duration(seconds: 2));

    final checkToken = await secureStorage.read(key: StorageKeys.accessToken);

    if (checkToken != null && checkToken.isNotEmpty) {
      emit(SplashAuthenticated());
    } else {
      emit(SplashUnAuthenticated());
    }
  }
}

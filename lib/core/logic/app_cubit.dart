import 'package:bloc/bloc.dart';
import 'package:joli_crm/core/constants/storage_keys.dart';
import 'package:joli_crm/main.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(false)) {
    loadTheme();
  }

  void loadTheme() {
    emit(AppState(prefs.getBool(key: StorageKeys.isDark) ?? false));
  }

  void toggleDarkMode() async {
    final newValue = !state.isDark;

    await prefs.set(key: StorageKeys.isDark, value: newValue);

    emit(AppState(newValue));
  }
}

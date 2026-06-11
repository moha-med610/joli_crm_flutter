import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/constants/storage_keys.dart';
import 'package:joli_crm/core/enum/role_enum.dart';
import 'package:joli_crm/core/navigation/app_screens.dart';
import 'package:joli_crm/core/navigation/drawer_items.dart';
import 'package:joli_crm/main.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState());

  void changeScreen(String id) {
    emit(state.copyWith(currentId: id));
  }

  Future<void> getScreens() async {
    final roleString = prefs.getString(key: StorageKeys.role);

    final role = RoleEnum.values.firstWhere((e) => e.name == roleString);

    final screens = drawerItems.where((e) => e.roles.contains(role)).toList();

    emit(state.copyWith(screens: screens, currentId: screens.first.id));
  }
}

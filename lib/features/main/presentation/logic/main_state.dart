part of 'main_cubit.dart';

class MainState {
  final String currentId;
  final List<AppScreens> screens;

  MainState({this.currentId = "", this.screens = const []});

  MainState copyWith({String? currentId, List<AppScreens>? screens}) {
    return MainState(
      currentId: currentId ?? this.currentId,
      screens: screens ?? this.screens,
    );
  }
}

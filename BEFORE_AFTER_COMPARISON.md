# Before & After Comparison

## 1. MainState Changes

### ❌ BEFORE
```dart
class MainState {
  final String? currentId;              // Nullable
  final bool? loadScreens;              // Confusing naming
  final List<AppScreens>? screens;      // Nullable

  const MainState({
    this.currentId,
    this.loadScreens = false,
    this.screens = const [],             // Default contradicts nullable type
  });

  MainState copyWith({
    String? currentId,
    bool? loadScreens,
    List<AppScreens>? screens,
  }) {
    return MainState(
      currentId: currentId ?? this.currentId,
      loadScreens: loadScreens ?? this.loadScreens,
      screens: screens ?? this.screens,
    );
  }
}
```

### ✅ AFTER
```dart
class MainState {
  final String currentId;               // Non-nullable with default
  final bool isLoading;                 // Clear intent
  final List<AppScreens> screens;       // Non-nullable with default

  const MainState({
    this.currentId = 'dashboard',       // Explicit default
    this.isLoading = false,
    this.screens = const [],
  });

  MainState copyWith({
    String? currentId,
    bool? isLoading,
    List<AppScreens>? screens,
  }) {
    return MainState(
      currentId: currentId ?? this.currentId,
      isLoading: isLoading ?? this.isLoading,
      screens: screens ?? this.screens,
    );
  }

  @override
  String toString() =>
      'MainState(currentId: $currentId, isLoading: $isLoading, screens: ${screens.length})';
}
```

**Benefits:**
- ✅ No null-checking needed
- ✅ Clear variable naming
- ✅ Explicit defaults
- ✅ Better debugging with toString()

---

## 2. MainCubit Changes

### ❌ BEFORE
```dart
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void init(List<AppScreens> screens) {  // Unused method
    if (screens.isEmpty) return;
    emit(state.copyWith(currentId: screens.first.id));
  }

  Future<void> loadScreens(UserEntity? user) async {
    emit(state.copyWith(loadScreens: true));  // First emit

    final loadedScreen = getDrawerItems(user?.role);

    emit(state.copyWith(screens: loadedScreen));  // Second emit - may miss currentId

    emit(state.copyWith(loadScreens: false));  // Third emit
  }

  void changeScreen(String id) {
    emit(state.copyWith(currentId: id));  // No validation
  }
}
```

**Problems:**
- ❌ Multiple emits cause unnecessary rebuilds
- ❌ currentId might remain null after loading screens
- ❌ No error handling for empty screens
- ❌ No validation in changeScreen()

### ✅ AFTER
```dart
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  Future<void> loadScreens(UserEntity? user) async {
    emit(state.copyWith(isLoading: true));  // Transition to loading

    // Simulate network delay if needed
    await Future.delayed(const Duration(milliseconds: 100));

    final loadedScreens = getDrawerItems(user?.role);

    if (loadedScreens.isEmpty) {
      emit(state.copyWith(isLoading: false));  // Clean up but don't crash
      return;
    }

    // Single atomic emit with all state updates
    emit(state.copyWith(
      screens: loadedScreens,
      currentId: loadedScreens.first.id,  // ✅ currentId guaranteed
      isLoading: false,
    ));
  }

  void changeScreen(String id) {
    // ✅ Validate before changing
    if (state.screens.any((screen) => screen.id == id)) {
      emit(state.copyWith(currentId: id));
    }
  }
}
```

**Improvements:**
- ✅ Atomic state updates (single emit)
- ✅ currentId always set after loading
- ✅ Handles empty screen list
- ✅ Validates changeScreen() requests
- ✅ Proper async flow

---

## 3. MainScreen Changes

### ❌ BEFORE
```dart
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(  // ❌ Unnecessary watch
      builder: (context, authState) {
        final user = context.read<AuthCubit>().currentUser;
        return BlocProvider(
          create: (_) => MainCubit()..loadScreens(user),
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              if (state.loadScreens == true) {  // ❌ Confusing null check
                return Scaffold(
                  body: Center(child: CupertinoActivityIndicator()),
                );
              }

              if (state.screens!.isEmpty) {  // ❌ Force unwrap
                print("Empty");  // ❌ No user feedback
              }

              // ❌ Unsafe null navigation
              final currentScreen = state.screens?.firstWhere(
                (e) => e.id == state.currentId,
                orElse: () => state.screens!.first,
              );

              return AppLayout(
                drawer: AppDrawer(items: state.screens!),  // ❌ Force unwrap
                appBar: AppBar(title: Text(currentScreen!.title)),  // ❌ Force unwrap
                child: currentScreen.screen,
              );
            },
          ),
        );
      },
    );
  }
}
```

**Problems:**
- ❌ Watches AuthCubit unnecessarily (rebuilds on auth state changes)
- ❌ Multiple null checks and force unwraps
- ❌ Confusing `loadScreens` boolean naming
- ❌ No empty state message
- ❌ Nested BlocBuilder complexity

### ✅ AFTER
```dart
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubit>().currentUser;  // ✅ Read once only

    return BlocProvider(
      create: (_) => MainCubit()..loadScreens(user),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          // ✅ Loading state
          if (state.isLoading) {
            return Scaffold(
              body: Center(
                child: CupertinoActivityIndicator(radius: 15),
              ),
            );
          }

          // ✅ Empty state with user feedback
          if (state.screens.isEmpty) {
            return Scaffold(
              body: Center(
                child: Text(
                  'No screens available for your role',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          }

          // ✅ Safe navigation with fallback
          final currentScreen = state.screens.firstWhere(
            (e) => e.id == state.currentId,
            orElse: () => state.screens.first,
          );

          return AppLayout(
            drawer: AppDrawer(items: state.screens),  // ✅ No unwrap needed
            appBar: AppBar(title: Text(currentScreen.title)),  // ✅ Safe access
            child: currentScreen.screen,
          );
        },
      ),
    );
  }
}
```

**Improvements:**
- ✅ Reads AuthCubit only once (no unnecessary rebuilds)
- ✅ Clear loading state handling
- ✅ User-friendly empty state message
- ✅ Safe navigation without force unwraps
- ✅ Cleaner, more readable code
- ✅ Removed nested BlocBuilder

---

## Summary of Changes

| Component | Changes | Result |
|-----------|---------|--------|
| **MainState** | Non-nullable fields with defaults | Better null-safety |
| **MainCubit** | Atomic updates, validation, error handling | Stable state management |
| **MainScreen** | Simple reader, clear loading/empty states, safe navigation | Better UI/UX and performance |

All changes ensure better stability, readability, and user experience! 🎉


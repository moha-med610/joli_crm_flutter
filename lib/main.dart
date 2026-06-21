import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joli_crm/core/logic/app_cubit.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/services/secure_storage_service.dart';
import 'package:joli_crm/core/services/shared_pref_service.dart';
import 'package:joli_crm/core/theme/dark_theme.dart';
import 'package:joli_crm/core/theme/light_theme.dart';
import 'package:joli_crm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:joli_crm/features/splash/presentation/screen/splash_screen.dart';

late final SharedPrefService prefs;
late final SecureStorageService secureStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await DependencyInjection.init();

  // Shared Preferences Service
  prefs = await SharedPrefService.getInstance();

  // Secure Storage Service
  secureStorage = SecureStorageService.getInstance();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("ar")],
      path: 'assets/translation',
      fallbackLocale: Locale("ar"),
      saveLocale: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppCubit()),
          BlocProvider(create: (_) => sl<AuthCubit>()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppCubit>().state.isDark;
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'JOLI CRM',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: isDark ? darkTheme : lightTheme,
          darkTheme: darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: SplashScreen(),
        );
      },
    );
  }
}

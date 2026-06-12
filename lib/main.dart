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

  // await secureStorage.deleteAll();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale("en"), Locale("ar")],
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
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final isDark = state.isDark;
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 600),
            switchInCurve: Curves.bounceIn,
            switchOutCurve: Curves.bounceIn,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'JOLI_CRM',
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: isDark ? darkTheme : lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.system,
              home: SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}

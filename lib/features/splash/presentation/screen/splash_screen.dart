import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/features/auth/presentation/screens/login_screen.dart';
import 'package:joli_crm/features/main/presentation/screen/main_screen.dart';
import 'package:joli_crm/features/splash/presentation/logic/splash_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _version = "";

  Future<void> _getAppVersion() async {
    final info = await PackageInfo.fromPlatform();

    setState(() {
      _version = info.version;
    });
  }

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..checkAuth(),
      child: AppLayout(
        appBar: null,
        bgColor: const Color(0XFF004643),
        child: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashAuthenticated) {
              context.pushReplacement(MainScreen());
            }
            if (state is SplashUnAuthenticated) {
              context.pushReplacement(LoginScreen());
            }
          },
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  SvgPicture.asset("assets/svgs/joli_crm_logo.svg", width: 200),
                  Spacer(),
                  LottieBuilder.asset(
                    "assets/lottie/loading_lottie.json",
                    width: 100,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Version $_version",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

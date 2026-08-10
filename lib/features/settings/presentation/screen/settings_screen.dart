import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joli_crm/core/logic/app_cubit.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/features/settings/presentation/screen/change_language_screen.dart';
import 'package:joli_crm/features/settings/presentation/screen/change_password_screen.dart';
import 'package:joli_crm/features/settings/presentation/widgets/section_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
    final isDark = context.watch<AppCubit>().state.isDark;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      context.push(const ChangeLanguageScreen());
                    },
                    borderRadius: .circular(15),
                    child: SectionWidget(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "app_lang".tr(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: .w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              context.locale.languageCode == "ar"
                                  ? "العربيه"
                                  : "English",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: .w500,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SectionWidget(
                    children: [
                      Text(
                        "dark_mode".tr(),
                        style: const TextStyle(fontSize: 20, fontWeight: .w500),
                      ),
                      CupertinoSwitch(
                        value: isDark,
                        onChanged: (value) {
                          context.read<AppCubit>().toggleDarkMode();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      context.push(const ChangePasswordScreen());
                    },
                    child: SectionWidget(
                      children: [
                        Text(
                          "change_password".tr(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: .w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Version $_version",
                    style: const TextStyle(fontSize: 18, fontWeight: .bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/app/cubits/theme_cubit.dart';
import 'package:paiting_by_numbers/app/localization/app_locales.dart';
import 'package:paiting_by_numbers/core/di/locator.dart';
import 'package:paiting_by_numbers/app/ui/theme/app_theme.dart';
import 'package:paiting_by_numbers/core/ui/widgets/failure_listener/failure_listener.dart';
import 'package:paiting_by_numbers/app/ui/system_ui_style.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class App extends StatelessWidget {
  const App({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: EasyLocalization(
        supportedLocales: AppLocales.supportedLocales,
        path: AppLocales.translationsPath,
        fallbackLocale: AppLocales.fallbackLocale,
        child: BlocProvider(
          create: (context) => locator<ThemeCubit>(),
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return Builder(
                builder: (localizationContext) => ShadApp.custom(
                  theme: AppTheme.shadThemeLight,
                  darkTheme: AppTheme.shadThemeDark,
                  themeMode: mode,
                  appBuilder: (context) => MaterialApp.router(
                    theme: AppTheme.themeLight,
                    darkTheme: AppTheme.themeDark,
                    themeMode: mode,
                    debugShowCheckedModeBanner: false,
                    routerConfig: router,
                    localizationsDelegates: [
                      ...localizationContext.localizationDelegates,
                      GlobalShadLocalizations.delegate,
                    ],
                    supportedLocales: localizationContext.supportedLocales,
                    locale: localizationContext.locale,
                    builder: (context, child) {
                      return ShadAppBuilder(
                        child: AnnotatedRegion<SystemUiOverlayStyle>(
                          value: Theme.of(context).brightness == Brightness.dark
                              ? SystemUiStyle.dark
                              : SystemUiStyle.light,
                          child: FailureListener(
                            child: child ?? const SizedBox.shrink(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

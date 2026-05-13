import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/app/localization/app_locales.dart';
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
        child: Builder(
          builder: (localizationContext) => ShadApp.custom(
            appBuilder: (context) => MaterialApp.router(
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
                    value: SystemUiStyle.main,
                    child: FailureListener(
                      child: child ?? const SizedBox.shrink(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

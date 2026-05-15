import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/core/utils/extensions/build_context_extensions.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/verify_email/verify_email_cubit.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/verify_email/verify_email_state.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:paiting_by_numbers/core/di/locator.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/log_out_use_case.dart';
import 'package:paiting_by_numbers/core/ui/widgets/ui_kit/app_button.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<VerifyEmailCubit>().sendVerificationEmail();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<VerifyEmailCubit>().reloadUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
      builder: (context, state) {
        final isResending = state.maybeWhen(
          loadingResend: () => true,
          orElse: () => false,
        );

        final isManualReloading = state.maybeWhen(
          loadingManual: () => true,
          orElse: () => false,
        );

        return Scaffold(
          backgroundColor: context.colorScheme.background,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      LucideIcons.mail,
                      size: 64.r,
                      color: context.colorScheme.primary,
                    ),
                    24.verticalSpace,
                    Text(
                      LocaleKeys.verify_email_title.tr(),
                      style: context.styles.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.foreground,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    16.verticalSpace,
                    Text(
                      LocaleKeys.verify_email_subtitle.tr(),
                      style: context.styles.bodyMedium?.copyWith(
                        color: context.colorScheme.mutedForeground,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    32.verticalSpace,
                    AppButton(
                      onPressed: isManualReloading || isResending
                          ? null
                          : () {
                              context.read<VerifyEmailCubit>().reloadUser(
                                isManual: true,
                              );
                            },
                      width: double.infinity,
                      isLoading: isManualReloading,
                      text: LocaleKeys.verify_email_i_have_verified.tr(),
                    ),
                    8.verticalSpace,
                    AppButton.outline(
                      onPressed: isResending || isManualReloading
                          ? null
                          : () {
                              context
                                  .read<VerifyEmailCubit>()
                                  .sendVerificationEmail();
                            },
                      width: double.infinity,
                      isLoading: isResending,
                      text: LocaleKeys.verify_email_resend.tr(),
                    ),
                    16.verticalSpace,
                    AppButton.link(
                      onPressed: isResending || isManualReloading
                          ? null
                          : () {
                              locator<LogOutUseCase>().call();
                            },
                      width: double.infinity,
                      foregroundColor: context.colorScheme.destructive,
                      text: LocaleKeys.verify_email_cancel.tr(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

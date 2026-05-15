import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/app_bar/common_app_bar.dart';
import 'package:paiting_by_numbers/core/ui/widgets/ui_kit/app_button.dart';
import 'package:paiting_by_numbers/core/utils/extensions/build_context_extensions.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/forgot_password/forgot_password_cubit.dart';
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/forgot_password/forgot_password_state.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/snack_bar/custom_snack_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<ShadFormState>();

  void _onResetPassword(BuildContext context) {
    if (_formKey.currentState!.saveAndValidate()) {
      final email = _formKey.currentState!.value['email'] as String;
      context.read<ForgotPasswordCubit>().sendResetLink(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            CustomSnackBar.showSuccessSnackBar(
              message: LocaleKeys.auth_reset_link_sent.tr(),
            );
            context.pop();
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Scaffold(
          appBar: CommonAppBar(
            title: LocaleKeys.auth_forgot_password_title.tr(),
            showBackButton: true,
          ),
          backgroundColor: context.colorScheme.background,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: ShadForm(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.auth_forgot_password_subtitle.tr(),
                        style: context.styles.bodyMedium?.copyWith(
                          color: context.colorScheme.mutedForeground,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      32.verticalSpace,
                      ShadInputFormField(
                        id: 'email',
                        placeholder: Text(LocaleKeys.auth_email.tr()),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => _onResetPassword(context),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: LocaleKeys.auth_email_required.tr(),
                          ),
                          FormBuilderValidators.email(
                            errorText: LocaleKeys.auth_invalid_email.tr(),
                          ),
                        ]),
                      ),
                      24.verticalSpace,
                      AppButton(
                        onPressed: () => _onResetPassword(context),
                        width: double.infinity,
                        isLoading: isLoading,
                        text: LocaleKeys.auth_send_reset_link.tr(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

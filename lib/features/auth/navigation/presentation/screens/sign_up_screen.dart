import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/core/utils/extensions/build_context_extensions.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<ShadFormState>();
  bool _obscurePassword = true;

  void _onSignUp() {
    if (_formKey.currentState!.saveAndValidate()) {
      // TODO: implement sign up logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    LocaleKeys.auth_sign_up_title.tr(),
                    style: context.styles.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.foreground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  8.verticalSpace,
                  Text(
                    LocaleKeys.auth_sign_up_subtitle.tr(),
                    style: context.styles.bodyMedium?.copyWith(
                      color: context.colorScheme.mutedForeground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  32.verticalSpace,
                  ShadInputFormField(
                    id: 'username',
                    placeholder: Text(LocaleKeys.auth_username.tr()),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: LocaleKeys.auth_username_required.tr(),
                      ),
                      FormBuilderValidators.minLength(
                        3,
                        errorText: LocaleKeys.auth_username_min_length.tr(),
                      ),
                    ]),
                  ),
                  12.verticalSpace,
                  ShadInputFormField(
                    id: 'email',
                    placeholder: Text(LocaleKeys.auth_email.tr()),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: LocaleKeys.auth_email_required.tr(),
                      ),
                      FormBuilderValidators.email(
                        errorText: LocaleKeys.auth_invalid_email.tr(),
                      ),
                    ]),
                  ),
                  12.verticalSpace,
                  ShadInputFormField(
                    id: 'password',
                    placeholder: Text(LocaleKeys.auth_password.tr()),
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _onSignUp(),
                    trailing: ShadIconButton.ghost(
                      width: 24.r,
                      height: 24.r,
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        _obscurePassword ? LucideIcons.eyeOff : LucideIcons.eye,
                        size: 14.r,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: LocaleKeys.auth_password_required.tr(),
                      ),
                      FormBuilderValidators.minLength(
                        6,
                        errorText: LocaleKeys.auth_password_min_length.tr(),
                      ),
                    ]),
                  ),
                  24.verticalSpace,
                  ShadButton(
                    onPressed: _onSignUp,
                    width: double.infinity,
                    child: Text(LocaleKeys.auth_sign_up.tr()),
                  ),
                  24.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: context.colorScheme.border),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          LocaleKeys.auth_or.tr().toUpperCase(),
                          style: context.styles.bodySmall?.copyWith(
                            color: context.colorScheme.mutedForeground,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: context.colorScheme.border),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  ShadButton.outline(
                    onPressed: () {
                      // TODO: Google Sign Up
                    },
                    width: double.infinity,
                    leading: const Icon(LucideIcons.goal, size: 18),
                    child: Text(LocaleKeys.auth_google_sign_in.tr()),
                  ),
                  24.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.auth_already_have_account.tr(),
                        style: context.styles.bodyMedium?.copyWith(
                          color: context.colorScheme.mutedForeground,
                        ),
                      ),
                      ShadButton.ghost(
                        onPressed: () => context.pop(),
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          LocaleKeys.auth_sign_in.tr(),
                          style: context.styles.bodyMedium?.copyWith(
                            color: context.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

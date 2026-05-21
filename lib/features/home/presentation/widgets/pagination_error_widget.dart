import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/ui/widgets/ui_kit/app_button.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PaginationErrorWidget extends StatelessWidget {
  final Failure error;
  final VoidCallback onRetry;

  const PaginationErrorWidget({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: colorScheme.destructive.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                LucideIcons.circleAlert,
                size: 24.r,
                color: colorScheme.destructive,
              ),
            ),
            12.verticalSpace,
            Text(
              LocaleKeys.home_load_more_failed.tr(),
              style: theme.textTheme.large.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: colorScheme.foreground,
              ),
              textAlign: TextAlign.center,
            ),
            4.verticalSpace,
            Text(
              error.messageKey.tr(),
              style: theme.textTheme.muted.copyWith(
                fontSize: 12.sp,
                color: colorScheme.mutedForeground,
              ),
              textAlign: TextAlign.center,
            ),
            16.verticalSpace,
            AppButton.outline(
              text: LocaleKeys.home_retry.tr(),
              onPressed: onRetry,
              size: ShadButtonSize.sm,
            ),
          ],
        ),
      ),
    );
  }
}

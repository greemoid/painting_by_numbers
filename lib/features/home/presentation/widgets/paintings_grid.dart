import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PaintingsGrid extends StatelessWidget {
  const PaintingsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Beautiful icon container
              Container(
                padding: EdgeInsets.all(24.r),
                decoration: BoxDecoration(
                  color: colorScheme.muted.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.border.withValues(alpha: 0.5),
                  ),
                ),
                child: Icon(
                  LucideIcons.palette,
                  size: 48.r,
                  color: colorScheme.primary,
                ),
              ),
              24.verticalSpace,
              // Title
              Text(
                'No Masterpieces Yet',
                style: theme.textTheme.large.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: colorScheme.foreground,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              8.verticalSpace,
              // Subtitle
              Text(
                'Browse historical artworks in the Explore tab, start coloring, and your completed paintings will appear here!',
                style: theme.textTheme.muted.copyWith(
                  fontSize: 13.sp,
                  color: colorScheme.mutedForeground,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_radiuses.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_widths.dart';
import 'package:paiting_by_numbers/app/ui/theme/shadows/app_box_shadows.dart';

class PaintingCard extends StatelessWidget {
  final String title;
  final String author;
  final String year;
  final double imageHeight;

  const PaintingCard({
    super.key,
    required this.title,
    required this.author,
    required this.year,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.card,
        borderRadius: BorderRadius.all(AppBorderRadiuses.roundedLg),
        border: Border.all(
          color: colorScheme.border,
          width: AppBorderWidths.border,
        ),
        boxShadow: AppBoxShadows.md,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image Placeholder
          Container(
            height: imageHeight,
            color: colorScheme.secondary,
            child: Icon(
              LucideIcons.image,
              color: colorScheme.mutedForeground.withValues(alpha: 0.5),
              size: 48.r,
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.p.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.foreground,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                8.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        author,
                        style: textTheme.muted.copyWith(
                          fontSize: 12.sp,
                          color: colorScheme
                              .primary, // Using primary for author to accent
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    4.horizontalSpace,
                    Text(
                      year,
                      style: textTheme.muted.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

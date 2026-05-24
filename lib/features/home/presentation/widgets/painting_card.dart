import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_radiuses.dart';

class PaintingCard extends StatelessWidget {
  final String title;
  final String author;
  final String year;
  final String imageUrl;
  final double aspectRatio;

  const PaintingCard({
    super.key,
    required this.title,
    required this.author,
    required this.year,
    required this.imageUrl,
    this.aspectRatio = 0.75,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(AppBorderRadiuses.roundedLg),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (context, url) => _PaintingShimmer(
                baseColor: colorScheme.muted.withValues(alpha: 0.5),
                highlightColor: colorScheme.muted,
              ),
              errorWidget: (context, url, error) => ColoredBox(
                color: colorScheme.muted.withValues(alpha: 0.3),
                child: Center(
                  child: Icon(
                    LucideIcons.imageOff,
                    color: colorScheme.mutedForeground,
                    size: 24.r,
                  ),
                ),
              ),
            ),
          ),
        ),
        4.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.muted.copyWith(
                  fontSize: 11.sp,
                  color: colorScheme.foreground,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              2.verticalSpace,
              RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: textTheme.muted.copyWith(fontSize: 10.sp, height: 1.2),
                  children: [
                    TextSpan(
                      text: author,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' • ',
                      style: TextStyle(color: colorScheme.mutedForeground),
                    ),
                    TextSpan(
                      text: year,
                      style: TextStyle(color: colorScheme.mutedForeground),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        8.verticalSpace,
      ],
    );
  }
}

class _PaintingShimmer extends StatelessWidget {
  final Color baseColor;
  final Color highlightColor;

  const _PaintingShimmer({
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: const ColoredBox(color: Colors.white),
  );
}

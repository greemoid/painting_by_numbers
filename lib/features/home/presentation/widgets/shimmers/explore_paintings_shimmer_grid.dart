import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_radiuses.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shimmer/shimmer.dart';

const _shimmerAspectRatios = [0.65, 0.85, 0.55, 0.78, 0.70];

class ExplorePaintingsShimmerGrid extends StatelessWidget {
  const ExplorePaintingsShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return SliverPadding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      sliver: SliverMasonryGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4.h,
        crossAxisSpacing: 4.w,
        childCount: 10,
        itemBuilder: (context, index) => _ShimmerCard(
          aspectRatio: _shimmerAspectRatios[index % _shimmerAspectRatios.length],
          baseColor: colorScheme.muted.withValues(alpha: 0.5),
          highlightColor: colorScheme.muted,
        ),
      ),
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  final double aspectRatio;
  final Color baseColor;
  final Color highlightColor;

  const _ShimmerCard({
    required this.aspectRatio,
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(AppBorderRadiuses.roundedLg),
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: const ColoredBox(color: Colors.white),
            ),
          ),
          8.verticalSpace,
          Container(
            height: 10.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          4.verticalSpace,
          Container(
            height: 8.h,
            width: 80.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}

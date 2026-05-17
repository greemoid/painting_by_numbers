import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_radiuses.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/loaders/app_loader.dart';
import 'package:paiting_by_numbers/features/home/presentation/state/explore_paintings_cubit.dart';
import 'package:paiting_by_numbers/features/home/presentation/state/explore_paintings_state.dart';
import 'package:paiting_by_numbers/features/home/presentation/widgets/painting_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shimmer/shimmer.dart';

const _shimmerAspectRatios = [0.65, 0.85, 0.55, 0.78, 0.70];

class ExplorePaintingsGrid extends StatefulWidget {
  const ExplorePaintingsGrid({super.key});

  @override
  State<ExplorePaintingsGrid> createState() => _ExplorePaintingsGridState();
}

class _ExplorePaintingsGridState extends State<ExplorePaintingsGrid> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final cubit = context.read<ExplorePaintingsCubit>();
        final isInitial = cubit.state.maybeMap(
          initial: (_) => true,
          orElse: () => false,
        );
        if (isInitial) {
          cubit.fetchNextPage();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorePaintingsCubit, ExplorePaintingsState>(
      builder: (context, state) => state.map(
        initial: (_) => const _ShimmerGrid(),
        loading: (_) => const _ShimmerGrid(),
        error: (e) => SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text(e.failure.toString())),
        ),
        data: (d) {
          final items = d.pagingState.pages?.expand((e) => e).toList() ?? [];
          final isLoadingMore = d.pagingState.isLoading;
          final hasMore = d.pagingState.hasNextPage;

          return SliverMainAxisGroup(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.h,
                  crossAxisSpacing: 4.w,
                  childCount: items.length,
                  itemBuilder: (context, index) {
                    if (index == items.length - 3 &&
                        hasMore &&
                        !isLoadingMore) {
                      context.read<ExplorePaintingsCubit>().fetchNextPage();
                    }
                    return PaintingCard(
                      title: items[index].title,
                      author: items[index].author,
                      year: items[index].year,
                      imageUrl: items[index].imageUrl,
                      aspectRatio: items[index].aspectRatio,
                    );
                  },
                ),
              ),
              if (isLoadingMore)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: const Center(child: AppLoader()),
                  ),
                )
              else
                SliverToBoxAdapter(child: 120.verticalSpace),
            ],
          );
        },
      ),
    );
  }
}

class _ShimmerGrid extends StatelessWidget {
  const _ShimmerGrid();

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

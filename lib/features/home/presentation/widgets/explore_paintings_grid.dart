import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/loaders/app_loader.dart';
import 'package:paiting_by_numbers/features/home/presentation/state/explore_paintings_cubit.dart';
import 'package:paiting_by_numbers/features/home/presentation/state/explore_paintings_state.dart';
import 'package:paiting_by_numbers/features/home/presentation/widgets/painting_card.dart';
import 'package:paiting_by_numbers/features/home/presentation/widgets/pagination_error_widget.dart';
import 'package:paiting_by_numbers/features/home/presentation/widgets/shimmers/explore_paintings_shimmer_grid.dart';

class ExplorePaintingsGrid extends StatefulWidget {
  const ExplorePaintingsGrid({super.key});

  static const double _bottomNavBarPadding = 120;

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
        initial: (_) => const ExplorePaintingsShimmerGrid(),
        loading: (_) => const ExplorePaintingsShimmerGrid(),
        error: (e) => SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text(e.failure.toString())),
        ),
        data: (d) {
          final items = d.items;
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
                    if (index >= items.length - 3 &&
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
              if (d.pagingState.error != null)
                SliverToBoxAdapter(
                  child: PaginationErrorWidget(
                    error: d.pagingState.error is Failure
                        ? d.pagingState.error as Failure
                        : const UnknownFailure(),
                    onRetry: () =>
                        context.read<ExplorePaintingsCubit>().fetchNextPage(),
                  ),
                )
              else if (isLoadingMore)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: const Center(child: AppLoader()),
                  ),
                ),
              SliverToBoxAdapter(
                child: ExplorePaintingsGrid._bottomNavBarPadding.verticalSpace,
              ),
            ],
          );
        },
      ),
    );
  }
}

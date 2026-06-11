import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/loaders/app_loader.dart';
import 'package:paiting_by_numbers/features/gallery/presentation/state/my_paintings_cubit.dart';
import 'package:paiting_by_numbers/features/gallery/presentation/state/my_paintings_state.dart';
import 'package:paiting_by_numbers/features/gallery/presentation/widgets/my_painting_card.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyPaintingsGrid extends StatelessWidget {
  const MyPaintingsGrid({super.key});

  static const double _bottomNavBarPadding = 120;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPaintingsCubit, MyPaintingsState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const Center(child: AppLoader()),
          loading: (_) => const Center(child: AppLoader()),
          error: (e) => CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Text(e.failure.messageKey.tr())),
              ),
            ],
          ),
          data: (d) {
            final items = d.items
                .where((item) => File(item.localImagePath).existsSync())
                .toList();

            if (items.isEmpty) {
              return const _EmptyState();
            }

            return CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.h,
                    crossAxisSpacing: 4.w,
                    childCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return MyPaintingCard(
                        title: item.name,
                        author: item.artist,
                        year: item.year.toString(),
                        localImagePath: item.localImagePath,
                        aspectRatio: 0.75, // Or use actual if available
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: _bottomNavBarPadding.verticalSpace,
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  Text(
                    LocaleKeys.home_no_masterpieces_title.tr(),
                    style: theme.textTheme.large.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: colorScheme.foreground,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  8.verticalSpace,
                  Text(
                    LocaleKeys.home_no_masterpieces_subtitle.tr(),
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
        ),
      ],
    );
  }
}

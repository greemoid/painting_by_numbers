import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_radiuses.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/app_bar/common_app_bar.dart';
import 'package:paiting_by_numbers/features/home/presentation/widgets/explore_paintings_grid.dart';
import 'package:paiting_by_numbers/features/home/presentation/widgets/paintings_grid.dart';
import 'package:paiting_by_numbers/features/home/utils/home_tab.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeTab _currentTab = HomeTab.myPaintings;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: CommonAppBar(title: LocaleKeys.home_title.tr(), showBottomBorder: false),
      body: CustomScrollView(
        slivers: [
          16.verticalSpace.toSliver(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: colorScheme.muted.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.all(AppBorderRadiuses.rounded),
                  border: Border.all(color: colorScheme.border),
                ),
                child: ShadTabs<HomeTab>(
                  value: _currentTab,
                  onChanged: (v) => setState(() => _currentTab = v),
                  gap: 0,
                  contentConstraints: BoxConstraints.tight(Size.zero),
                  tabBarConstraints: BoxConstraints(maxWidth: 1.sw - 40.w),
                  decoration: const ShadDecoration(
                    border: ShadBorder.none,
                    color: Colors.transparent,
                  ),
                  tabs: [
                    ShadTab(
                      value: HomeTab.myPaintings,
                      child: Text(
                        LocaleKeys.home_my_paintings.tr(),
                        style: theme.textTheme.small.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                    ShadTab(
                      value: HomeTab.explore,
                      child: Text(
                        LocaleKeys.home_explore.tr(),
                        style: theme.textTheme.small.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          8.verticalSpace.toSliver(),
          _currentTab == HomeTab.myPaintings
              ? const PaintingsGrid()
              : const ExplorePaintingsGrid(),
        ],
      ),
    );
  }
}

extension on Widget {
  Widget toSliver() => SliverToBoxAdapter(child: this);
}

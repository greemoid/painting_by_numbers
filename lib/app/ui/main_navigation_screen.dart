import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_radiuses.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_widths.dart';
import 'package:paiting_by_numbers/app/ui/theme/shadows/app_box_shadows.dart';

class MainNavigationScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationScreen({super.key, required this.navigationShell});

  void _onItemTapped(int index) => navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;

    return Scaffold(
      extendBody: true,
      backgroundColor: colorScheme.background,
      body: BottomBar(
        layout: BottomBarLayout(
          borderRadius: BorderRadius.all(AppBorderRadiuses.rounded3xl),
        ),
        body: navigationShell,
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.all(AppBorderRadiuses.rounded3xl),
            border: Border.all(
              color: colorScheme.border,
              width: AppBorderWidths.border,
            ),
            boxShadow: AppBoxShadows.lg,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _NavItem(
                icon: LucideIcons.palette,
                isSelected: navigationShell.currentIndex == 0,
                onTap: () => _onItemTapped(0),
                colorScheme: colorScheme,
              ),
              16.horizontalSpace,
              _FabNavItem(
                icon: LucideIcons.plus,
                isSelected: navigationShell.currentIndex == 1,
                onTap: () => _onItemTapped(1),
                colorScheme: colorScheme,
              ),
              16.horizontalSpace,
              _NavItem(
                icon: LucideIcons.settings,
                isSelected: navigationShell.currentIndex == 2,
                onTap: () => _onItemTapped(2),
                colorScheme: colorScheme,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.colorScheme,
  });

  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final ShadColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? colorScheme.primary
        : colorScheme.mutedForeground;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all(12.r),
        child: Icon(icon, color: color, size: 24.r),
      ),
    );
  }
}

class _FabNavItem extends StatelessWidget {
  const _FabNavItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.colorScheme,
  });

  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final ShadColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          shape: BoxShape.circle,
          boxShadow: AppBoxShadows.md,
        ),
        child: Icon(icon, color: colorScheme.primaryForeground, size: 28.r),
      ),
    );
  }
}

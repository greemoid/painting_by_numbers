import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paiting_by_numbers/core/utils/extensions/build_context_extensions.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.title,
    this.titleTrailing,
    this.centerTitle = false,
    this.actions,
    this.height,
    this.showBottomBorder = true,
    this.showBackButton = false,
  });

  final String title;
  final Widget? titleTrailing;
  final bool centerTitle;
  final List<Widget>? actions;
  final double? height;
  final bool showBottomBorder;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              title,
              style: context.styles.titleMedium?.copyWith(
                color: context.colorScheme.foreground,
              ),
              maxLines: 2,
            ),
          ),
          if (titleTrailing != null) ...[8.horizontalSpace, titleTrailing!],
        ],
      ),
      centerTitle: centerTitle,
      backgroundColor: context.colorScheme.background,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? Center(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: ShadIconButton.ghost(
                  icon: const Icon(LucideIcons.chevronLeft),
                  onPressed: context.canPop() ? () => context.pop() : null,
                ),
              ),
            )
          : null,
      toolbarHeight: height ?? 68.h,
      actions: actions,
      actionsPadding: EdgeInsets.only(right: 16.w),
      titleSpacing: 8.w,
      bottom: showBottomBorder
          ? PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(height: 1, color: context.colorScheme.border),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 68.h);
}

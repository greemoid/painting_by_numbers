import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/resources/gen/assets.gen.dart';

// TODO: Обов'язково переконайтеся, що у вашому проєкті визначено AppRouter з static navigatorKey,
// або замініть AppRouter.navigatorKey на ваш актуальний GlobalKey<NavigatorState>.
// Оскільки в paiting_by_numbers AppRouter не знайдено, я закоментував імпорт.

class CustomSnackBar {
  static OverlayEntry? _currentOverlay;
  static Timer? _timer;
  static AnimationController? _animationController;
  static CurvedAnimation? _curvedAnimation;
  static bool _isDismissing = false;

  static void showWarningSnackBar({
    String? title,
    required String message,
    SvgGenImage? icon,
    bool hasCloseButton = true,
  }) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: const Color(0xFFFFFBEB),
      borderColor: const Color(0xFFFEF3C7),
      textColor: const Color(0xFF92400E),
      icon: icon,
      hasCloseButton: hasCloseButton,
    );
  }

  static void showErrorSnackBar({
    String? title,
    required String message,
    SvgGenImage? icon,
  }) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: const Color(0xFFFEF2F2),
      borderColor: const Color(0xFFFEE2E2),
      textColor: const Color(0xFF991B1B),
      icon: icon,
    );
  }

  static void showSuccessSnackBar({
    String? title,
    required String message,
    SvgGenImage? icon,
  }) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: const Color(0xFFF0FDF4),
      borderColor: const Color(0xFFDCFCE7),
      textColor: const Color(0xFF166534),
      icon: icon,
    );
  }

  static void _showSnackBar({
    required String? title,
    required String message,
    required Color backgroundColor,
    required Color borderColor,
    required Color textColor,
    SvgGenImage? icon,
    bool hasCloseButton = true,
  }) {
    _removeCurrent();

    // Логіка отримання контексту згідно з ms_finance
    final context = _getNavigatorContext();
    if (context == null) return;

    final overlayState = Navigator.of(context, rootNavigator: true).overlay;
    if (overlayState == null) return;

    final animationController = AnimationController(
      vsync: overlayState,
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 600),
    );

    _animationController = animationController;

    final curved = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutExpo,
      reverseCurve: Curves.easeInExpo,
    );
    _curvedAnimation = curved;

    final entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: AnimatedBuilder(
              animation: curved,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -100 * (1 - curved.value)),
                  child: Opacity(opacity: curved.value, child: child),
                );
              },
              child: _SnackBarWidget(
                title: title,
                message: message,
                backgroundColor: backgroundColor,
                borderColor: borderColor,
                textColor: textColor,
                icon: icon,
                onClose: () => _dismissWithAnimation(),
                hasCloseButton: hasCloseButton,
              ),
            ),
          ),
        );
      },
    );

    _currentOverlay = entry;
    overlayState.insert(entry);

    animationController.forward();

    _timer = Timer(const Duration(milliseconds: 2500), () {
      _dismissWithAnimation();
    });
  }

  static BuildContext? _getNavigatorContext() {
    // Тут має бути ваш navigatorKey. Наприклад:
    // return AppRouter.navigatorKey.currentContext;
    return null; // Тимчасовий заповнювач для уникнення помилок статики
  }

  static Future<void> _dismissWithAnimation() async {
    if (_isDismissing || _currentOverlay == null) return;
    _isDismissing = true;

    _timer?.cancel();
    _timer = null;

    final controller = _animationController;
    final overlay = _currentOverlay;

    if (controller != null && overlay != null) {
      try {
        await controller.reverse();
      } catch (_) {
        // Controller might be disposed
      }

      if (_currentOverlay == overlay) {
        _removeCurrent();
      }
    }
    _isDismissing = false;
  }

  static void _removeCurrent() {
    _timer?.cancel();
    _timer = null;
    _isDismissing = false;
    _currentOverlay?.remove();
    _currentOverlay = null;
    _curvedAnimation?.dispose();
    _curvedAnimation = null;
    _animationController?.dispose();
    _animationController = null;
  }
}

class _SnackBarWidget extends StatelessWidget {
  final String? title;
  final String message;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onClose;
  final SvgGenImage? icon;
  final bool hasCloseButton;

  const _SnackBarWidget({
    required this.title,
    required this.message,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.onClose,
    this.icon,
    this.hasCloseButton = true,
  });

  @override
  Widget build(BuildContext context) {
    // Власна реалізація кнопки закриття (замість GhostIconButton)
    final closeButton = GestureDetector(
      onTap: onClose,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.all(4.r),
        child: Icon(
          Icons.close,
          size: 16.r,
          color: textColor.withOpacity(0.5),
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(top: 12.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Row(
            crossAxisAlignment: title != null
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (icon != null && title == null) ...[
                icon!.svg(
                  width: 16.r,
                  height: 16.r,
                  colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                ),
                8.horizontalSpace,
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (icon != null) ...[
                            icon!.svg(
                              width: 16.r,
                              height: 16.r,
                              colorFilter: ColorFilter.mode(
                                textColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            8.horizontalSpace,
                          ],
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title!,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: textColor,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                4.verticalSpace,
                              ],
                            ),
                          ),

                          if (hasCloseButton) ...[
                            8.horizontalSpace,
                            closeButton,
                          ],
                        ],
                      ),
                    Text(
                      message,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
              if (title == null && hasCloseButton) ...[
                8.horizontalSpace,
                closeButton,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

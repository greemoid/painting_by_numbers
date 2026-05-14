import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/app/router/app_router.dart';
import 'package:paiting_by_numbers/resources/gen/assets.gen.dart';

class _SnackBarRequest {
  final String? title;
  final String message;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final SvgGenImage? icon;
  final bool hasCloseButton;

  _SnackBarRequest({
    required this.title,
    required this.message,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    this.icon,
    this.hasCloseButton = true,
  });
}

class _SnackBarManager {
  static final _SnackBarManager instance = _SnackBarManager._();
  _SnackBarManager._();

  final List<_SnackBarRequest> _queue = [];
  bool _isShowing = false;

  OverlayEntry? _currentOverlay;
  Timer? _timer;
  AnimationController? _animationController;
  CurvedAnimation? _curvedAnimation;
  bool _isDismissing = false;

  void show(_SnackBarRequest request) {
    _queue.add(request);
    _processQueue();
  }

  void _processQueue() {
    if (_isShowing || _queue.isEmpty) return;

    final request = _queue.removeAt(0);
    _showSnackBar(request);
  }

  void _showSnackBar(_SnackBarRequest request) {
    _isShowing = true;

    final context = _getNavigatorContext();
    if (context == null) {
      _cleanupAndNext();
      return;
    }

    final overlayState = Navigator.of(context, rootNavigator: true).overlay;
    if (overlayState == null) {
      _cleanupAndNext();
      return;
    }

    _animationController = AnimationController(
      vsync: overlayState,
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 600),
    );

    _curvedAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeOutExpo,
      reverseCurve: Curves.easeInExpo,
    );

    _currentOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: AnimatedBuilder(
              animation: _curvedAnimation!,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -100 * (1 - _curvedAnimation!.value)),
                  child: Opacity(
                    opacity: _curvedAnimation!.value,
                    child: child,
                  ),
                );
              },
              child: _SnackBarWidget(
                title: request.title,
                message: request.message,
                backgroundColor: request.backgroundColor,
                borderColor: request.borderColor,
                textColor: request.textColor,
                icon: request.icon,
                onClose: () => _dismissWithAnimation(),
                hasCloseButton: request.hasCloseButton,
              ),
            ),
          ),
        );
      },
    );

    overlayState.insert(_currentOverlay!);

    _animationController!.forward();

    _timer = Timer(const Duration(milliseconds: 2500), () {
      _dismissWithAnimation();
    });
  }

  BuildContext? _getNavigatorContext() {
    return AppRouter.navigatorKey.currentContext;
  }

  Future<void> _dismissWithAnimation() async {
    if (_isDismissing) return;
    _isDismissing = true;

    _timer?.cancel();
    _timer = null;

    if (_animationController != null) {
      try {
        await _animationController!.reverse();
      } catch (_) {
        // Controller might be disposed
      }
    }

    _cleanupAndNext();
  }

  void _cleanupAndNext() {
    _timer?.cancel();
    _timer = null;

    _currentOverlay?.remove();
    _currentOverlay = null;

    _curvedAnimation?.dispose();
    _curvedAnimation = null;

    _animationController?.dispose();
    _animationController = null;

    _isDismissing = false;
    _isShowing = false;

    _processQueue();
  }
}

class CustomSnackBar {
  static void showWarningSnackBar({
    String? title,
    required String message,
    SvgGenImage? icon,
    bool hasCloseButton = true,
  }) {
    _SnackBarManager.instance.show(
      _SnackBarRequest(
        title: title,
        message: message,
        backgroundColor: const Color(0xFFFFFBEB),
        borderColor: const Color(0xFFFEF3C7),
        textColor: const Color(0xFF92400E),
        icon: icon,
        hasCloseButton: hasCloseButton,
      ),
    );
  }

  static void showErrorSnackBar({
    String? title,
    required String message,
    SvgGenImage? icon,
  }) {
    _SnackBarManager.instance.show(
      _SnackBarRequest(
        title: title,
        message: message,
        backgroundColor: const Color(0xFFFEF2F2),
        borderColor: const Color(0xFFFEE2E2),
        textColor: const Color(0xFF991B1B),
        icon: icon,
      ),
    );
  }

  static void showSuccessSnackBar({
    String? title,
    required String message,
    SvgGenImage? icon,
  }) {
    _SnackBarManager.instance.show(
      _SnackBarRequest(
        title: title,
        message: message,
        backgroundColor: const Color(0xFFF0FDF4),
        borderColor: const Color(0xFFDCFCE7),
        textColor: const Color(0xFF166534),
        icon: icon,
      ),
    );
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
    final closeButton = GestureDetector(
      onTap: onClose,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.all(4.r),
        child: Icon(
          Icons.close,
          size: 16.r,
          color: textColor.withValues(alpha: 0.5),
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
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(
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
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: textColor),
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

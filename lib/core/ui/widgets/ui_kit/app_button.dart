import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:paiting_by_numbers/core/utils/extensions/build_context_extensions.dart';

enum AppButtonVariant {
  primary,
  outline,
  ghost,
  secondary,
  destructive,
  link,
  raw,
}

/// A wrapper around [ShadButton] that seamlessly handles the loading state
/// while preserving full customization capabilities.
class AppButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final bool isLoading;
  final AppButtonVariant variant;

  // Customization properties matching ShadButton
  final ShadButtonSize? size;
  final MouseCursor? cursor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final Color? hoverForegroundColor;
  final Color? pressedBackgroundColor;
  final Color? pressedForegroundColor;
  final bool autofocus;
  final FocusNode? focusNode;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final TextDecoration? textDecoration;
  final TextDecoration? hoverTextDecoration;
  final ShadDecoration? decoration;
  final bool enabled;
  final ShadStatesController? statesController;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  const AppButton({
    super.key,
    this.child,
    this.text,
    this.leading,
    this.trailing,
    this.onPressed,
    this.isLoading = false,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : assert(
         child != null || text != null,
         'Either child or text must be provided',
       ),
       variant = AppButtonVariant.primary;

  const AppButton.outline({
    super.key,
    this.child,
    this.text,
    this.leading,
    this.trailing,
    this.onPressed,
    this.isLoading = false,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : assert(
         child != null || text != null,
         'Either child or text must be provided',
       ),
       variant = AppButtonVariant.outline;

  const AppButton.ghost({
    super.key,
    this.child,
    this.text,
    this.leading,
    this.trailing,
    this.onPressed,
    this.isLoading = false,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : assert(
         child != null || text != null,
         'Either child or text must be provided',
       ),
       variant = AppButtonVariant.ghost;

  const AppButton.destructive({
    super.key,
    this.child,
    this.text,
    this.leading,
    this.trailing,
    this.onPressed,
    this.isLoading = false,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : assert(
         child != null || text != null,
         'Either child or text must be provided',
       ),
       variant = AppButtonVariant.destructive;

  const AppButton.secondary({
    super.key,
    this.child,
    this.text,
    this.leading,
    this.trailing,
    this.onPressed,
    this.isLoading = false,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : assert(
         child != null || text != null,
         'Either child or text must be provided',
       ),
       variant = AppButtonVariant.secondary;

  const AppButton.link({
    super.key,
    this.child,
    this.text,
    this.leading,
    this.trailing,
    this.onPressed,
    this.isLoading = false,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : assert(
         child != null || text != null,
         'Either child or text must be provided',
       ),
       variant = AppButtonVariant.link;

  const AppButton.raw({
    super.key,
    this.child,
    this.text,
    this.leading,
    this.trailing,
    this.onPressed,
    this.isLoading = false,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : assert(
         child != null || text != null,
         'Either child or text must be provided',
       ),
       variant = AppButtonVariant.raw;

  @override
  Widget build(BuildContext context) {
    final effectiveEnabled = enabled && !isLoading;
    final effectiveOnPressed = effectiveEnabled ? onPressed : null;
    final effectiveOnLongPress = effectiveEnabled ? onLongPress : null;
    final effectiveLeading = isLoading ? null : leading;
    final effectiveTrailing = isLoading ? null : trailing;

    final actualChild =
        child ??
        Text(
          text!,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        );

    // Determine loader color based on variant
    Color loaderColor;
    switch (variant) {
      case AppButtonVariant.primary:
      case AppButtonVariant.destructive:
        loaderColor = context.colorScheme.primaryForeground;
        break;
      case AppButtonVariant.outline:
      case AppButtonVariant.ghost:
      case AppButtonVariant.secondary:
      case AppButtonVariant.link:
      case AppButtonVariant.raw:
        loaderColor = context.colorScheme.primary;
        break;
    }

    final content = isLoading
        ? SizedBox.square(
            dimension: 16.r,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: foregroundColor ?? loaderColor,
            ),
          )
        : actualChild;

    switch (variant) {
      case AppButtonVariant.primary:
        return ShadButton(
          onPressed: effectiveOnPressed,
          onLongPress: effectiveOnLongPress,
          leading: effectiveLeading,
          trailing: effectiveTrailing,
          size: size,
          cursor: cursor,
          width: width,
          height: height,
          padding: padding,
          backgroundColor: backgroundColor,
          hoverBackgroundColor: hoverBackgroundColor,
          foregroundColor: foregroundColor,
          hoverForegroundColor: hoverForegroundColor,
          pressedBackgroundColor: pressedBackgroundColor,
          pressedForegroundColor: pressedForegroundColor,
          autofocus: autofocus,
          focusNode: focusNode,
          shadows: shadows,
          gradient: gradient,
          textDecoration: textDecoration,
          hoverTextDecoration: hoverTextDecoration,
          decoration: decoration,
          enabled: enabled,
          statesController: statesController,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          child: content,
        );
      case AppButtonVariant.outline:
        return ShadButton.outline(
          onPressed: effectiveOnPressed,
          onLongPress: effectiveOnLongPress,
          leading: effectiveLeading,
          trailing: effectiveTrailing,
          size: size,
          cursor: cursor,
          width: width,
          height: height,
          padding: padding,
          backgroundColor: backgroundColor,
          hoverBackgroundColor: hoverBackgroundColor,
          foregroundColor: foregroundColor,
          hoverForegroundColor: hoverForegroundColor,
          pressedBackgroundColor: pressedBackgroundColor,
          pressedForegroundColor: pressedForegroundColor,
          autofocus: autofocus,
          focusNode: focusNode,
          shadows: shadows,
          gradient: gradient,
          textDecoration: textDecoration,
          hoverTextDecoration: hoverTextDecoration,
          decoration: decoration,
          enabled: enabled,
          statesController: statesController,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          child: content,
        );
      case AppButtonVariant.ghost:
        return ShadButton.ghost(
          onPressed: effectiveOnPressed,
          onLongPress: effectiveOnLongPress,
          leading: effectiveLeading,
          trailing: effectiveTrailing,
          size: size,
          cursor: cursor,
          width: width,
          height: height,
          padding: padding,
          backgroundColor: backgroundColor,
          hoverBackgroundColor: hoverBackgroundColor,
          foregroundColor: foregroundColor,
          hoverForegroundColor: hoverForegroundColor,
          pressedBackgroundColor: pressedBackgroundColor,
          pressedForegroundColor: pressedForegroundColor,
          autofocus: autofocus,
          focusNode: focusNode,
          shadows: shadows,
          gradient: gradient,
          textDecoration: textDecoration,
          hoverTextDecoration: hoverTextDecoration,
          decoration: decoration,
          enabled: enabled,
          statesController: statesController,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          child: content,
        );
      case AppButtonVariant.destructive:
        return ShadButton.destructive(
          onPressed: effectiveOnPressed,
          onLongPress: effectiveOnLongPress,
          leading: effectiveLeading,
          trailing: effectiveTrailing,
          size: size,
          cursor: cursor,
          width: width,
          height: height,
          padding: padding,
          backgroundColor: backgroundColor,
          hoverBackgroundColor: hoverBackgroundColor,
          foregroundColor: foregroundColor,
          hoverForegroundColor: hoverForegroundColor,
          pressedBackgroundColor: pressedBackgroundColor,
          pressedForegroundColor: pressedForegroundColor,
          autofocus: autofocus,
          focusNode: focusNode,
          shadows: shadows,
          gradient: gradient,
          textDecoration: textDecoration,
          hoverTextDecoration: hoverTextDecoration,
          decoration: decoration,
          enabled: enabled,
          statesController: statesController,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          child: content,
        );
      case AppButtonVariant.secondary:
        return ShadButton.secondary(
          onPressed: effectiveOnPressed,
          onLongPress: effectiveOnLongPress,
          leading: effectiveLeading,
          trailing: effectiveTrailing,
          size: size,
          cursor: cursor,
          width: width,
          height: height,
          padding: padding,
          backgroundColor: backgroundColor,
          hoverBackgroundColor: hoverBackgroundColor,
          foregroundColor: foregroundColor,
          hoverForegroundColor: hoverForegroundColor,
          pressedBackgroundColor: pressedBackgroundColor,
          pressedForegroundColor: pressedForegroundColor,
          autofocus: autofocus,
          focusNode: focusNode,
          shadows: shadows,
          gradient: gradient,
          textDecoration: textDecoration,
          hoverTextDecoration: hoverTextDecoration,
          decoration: decoration,
          enabled: enabled,
          statesController: statesController,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          child: content,
        );
      case AppButtonVariant.link:
        return ShadButton.link(
          onPressed: effectiveOnPressed,
          onLongPress: effectiveOnLongPress,
          leading: effectiveLeading,
          trailing: effectiveTrailing,
          size: size,
          cursor: cursor,
          width: width,
          height: height,
          padding: padding,
          backgroundColor: backgroundColor,
          hoverBackgroundColor: hoverBackgroundColor,
          foregroundColor: foregroundColor,
          hoverForegroundColor: hoverForegroundColor,
          pressedBackgroundColor: pressedBackgroundColor,
          pressedForegroundColor: pressedForegroundColor,
          autofocus: autofocus,
          focusNode: focusNode,
          shadows: shadows,
          gradient: gradient,
          textDecoration: textDecoration,
          hoverTextDecoration: hoverTextDecoration,
          decoration: decoration,
          enabled: enabled,
          statesController: statesController,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          child: content,
        );
      case AppButtonVariant.raw:
        return ShadButton.raw(
          variant: ShadButtonVariant.primary,
          onPressed: effectiveOnPressed,
          onLongPress: effectiveOnLongPress,
          leading: effectiveLeading,
          trailing: effectiveTrailing,
          size: size,
          cursor: cursor,
          width: width,
          height: height,
          padding: padding,
          backgroundColor: backgroundColor,
          hoverBackgroundColor: hoverBackgroundColor,
          foregroundColor: foregroundColor,
          hoverForegroundColor: hoverForegroundColor,
          pressedBackgroundColor: pressedBackgroundColor,
          pressedForegroundColor: pressedForegroundColor,
          autofocus: autofocus,
          focusNode: focusNode,
          shadows: shadows,
          gradient: gradient,
          textDecoration: textDecoration,
          hoverTextDecoration: hoverTextDecoration,
          decoration: decoration,
          enabled: enabled,
          statesController: statesController,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          child: content,
        );
    }
  }
}

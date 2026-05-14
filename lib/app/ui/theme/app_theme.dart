import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_radiuses.dart';
import 'package:paiting_by_numbers/app/ui/theme/app_colors.dart';
import 'package:paiting_by_numbers/app/ui/theme/shadows/app_box_shadows.dart';
import 'package:paiting_by_numbers/app/ui/theme/typography/app_typography.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// Custom ThemeExtension for MaterialPinTheme if it's not built-in:
class MaterialPinThemeExtension
    extends ThemeExtension<MaterialPinThemeExtension> {
  final MaterialPinTheme theme;
  const MaterialPinThemeExtension({required this.theme});

  @override
  ThemeExtension<MaterialPinThemeExtension> copyWith({
    MaterialPinTheme? theme,
  }) {
    return MaterialPinThemeExtension(theme: theme ?? this.theme);
  }

  @override
  ThemeExtension<MaterialPinThemeExtension> lerp(
    ThemeExtension<MaterialPinThemeExtension>? other,
    double t,
  ) {
    if (other is! MaterialPinThemeExtension) return this;
    return MaterialPinThemeExtension(theme: other.theme); // basic lerp
  }
}

class MaterialPinTheme {
  final MaterialPinShape shape;
  final Size cellSize;
  final TextStyle textStyle;
  final double spacing;
  final BorderRadius borderRadius;
  final double borderWidth;
  final double focusedBorderWidth;
  final Color borderColor;
  final Color filledBorderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final Color focusedFillColor;
  final Color filledFillColor;
  final Color errorFillColor;
  final Color errorBorderColor;
  final TextStyle errorTextStyle;
  final MaterialPinAnimation entryAnimation;
  final Color cursorColor;

  const MaterialPinTheme({
    required this.shape,
    required this.cellSize,
    required this.textStyle,
    required this.spacing,
    required this.borderRadius,
    required this.borderWidth,
    required this.focusedBorderWidth,
    required this.borderColor,
    required this.filledBorderColor,
    required this.focusedBorderColor,
    required this.fillColor,
    required this.focusedFillColor,
    required this.filledFillColor,
    required this.errorFillColor,
    required this.errorBorderColor,
    required this.errorTextStyle,
    required this.entryAnimation,
    required this.cursorColor,
  });
}

enum MaterialPinShape { outlined }

enum MaterialPinAnimation { fade }

class AppTheme {
  // --- Shadcn Color Schemes ---
  static const lightColorScheme = ShadColorScheme(
    background: AppColors.backgroundLight,
    foreground: AppColors.foregroundLight,
    card: AppColors.cardLight,
    cardForeground: AppColors.cardForegroundLight,
    popover: AppColors.popoverLight,
    popoverForeground: AppColors.popoverForegroundLight,
    primary: AppColors.primaryLight,
    primaryForeground: AppColors.primaryForegroundLight,
    secondary: AppColors.secondaryLight,
    secondaryForeground: AppColors.secondaryForegroundLight,
    muted: AppColors.mutedLight,
    mutedForeground: AppColors.mutedForegroundLight,
    accent: AppColors.accentLight,
    accentForeground: AppColors.accentForegroundLight,
    destructive: AppColors.destructiveLight,
    destructiveForeground: AppColors.destructiveForegroundLight,
    border: AppColors.borderLight,
    input: AppColors.inputLight,
    ring: AppColors.ringLight,
    selection: AppColors.primaryLight,
  );

  static const darkColorScheme = ShadColorScheme(
    background: AppColors.backgroundDark,
    foreground: AppColors.foregroundDark,
    card: AppColors.cardDark,
    cardForeground: AppColors.cardForegroundDark,
    popover: AppColors.popoverDark,
    popoverForeground: AppColors.popoverForegroundDark,
    primary: AppColors.primaryDark,
    primaryForeground: AppColors.primaryForegroundDark,
    secondary: AppColors.secondaryDark,
    secondaryForeground: AppColors.secondaryForegroundDark,
    muted: AppColors.mutedDark,
    mutedForeground: AppColors.mutedForegroundDark,
    accent: AppColors.accentDark,
    accentForeground: AppColors.accentForegroundDark,
    destructive: AppColors.destructiveDark,
    destructiveForeground: AppColors.destructiveForegroundDark,
    border: AppColors.borderDark,
    input: AppColors.inputDark,
    ring: AppColors.ringDark,
    selection: AppColors.primaryDark,
  );

  // --- Shadcn Themes ---
  static ShadThemeData get shadThemeLight => _buildShadTheme(
    colorScheme: lightColorScheme,
    brightness: Brightness.light,
  );

  static ShadThemeData get shadThemeDark => _buildShadTheme(
    colorScheme: darkColorScheme,
    brightness: Brightness.dark,
  );

  static ShadThemeData _buildShadTheme({
    required ShadColorScheme colorScheme,
    required Brightness brightness,
  }) {
    return ShadThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      disabledOpacity: 0.5,
      textTheme: ShadTextTheme(
        h1Large: AppTypography.displayLarge,
        h1: AppTypography.displayMedium,
        h2: AppTypography.displaySmall,
        h3: AppTypography.headlineLarge,
        h4: AppTypography.headlineMedium,
        p: AppTypography.bodyLarge,
        blockquote: AppTypography.bodyMedium,
        table: AppTypography.titleMedium,
        list: AppTypography.bodyMedium,
        lead: AppTypography.titleLarge,
        large: AppTypography.titleMedium,
        small: AppTypography.bodySmall,
        muted: AppTypography.bodySmall,
      ),
      radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
      decoration: ShadDecoration(
        disableSecondaryBorder: true,
        errorStyle: AppTypography.bodySmall.copyWith(
          color: colorScheme.destructive,
        ),
        errorPadding: EdgeInsets.only(top: 10.h),
      ),
      inputTheme: ShadInputTheme(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: ShadDecoration(
          color: colorScheme.secondary,
          shadows: AppBoxShadows.xs,
          border: ShadBorder.all(
            color: colorScheme.border,
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          focusedBorder: ShadBorder.all(
            color: colorScheme.primary,
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          errorBorder: ShadBorder.all(
            color: colorScheme.destructive.withValues(alpha: 0.5),
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        style: AppTypography.bodyMedium.copyWith(color: colorScheme.foreground),
        placeholderStyle: AppTypography.bodyMedium.copyWith(
          color: colorScheme.mutedForeground,
        ),
        cursorColor: colorScheme.foreground,
      ),
      selectTheme: ShadSelectTheme(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: ShadDecoration(
          color: colorScheme.secondary,
          shadows: AppBoxShadows.xs,
          border: ShadBorder.all(
            color: colorScheme.border,
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          focusedBorder: ShadBorder.all(
            color: colorScheme.primary,
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          errorBorder: ShadBorder.all(
            color: colorScheme.destructive.withValues(alpha: 0.5),
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        shadows: AppBoxShadows.lg,
      ),
      primaryButtonTheme: ShadButtonTheme(
        shadows: AppBoxShadows.xs,
        textStyle: AppTypography.titleSmall,
        foregroundColor: colorScheme.primaryForeground,
        backgroundColor: colorScheme.primary,
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: Colors.transparent,
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
      secondaryButtonTheme: ShadButtonTheme(
        shadows: AppBoxShadows.xs,
        textStyle: AppTypography.titleSmall,
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.secondaryForeground,
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: colorScheme.border,
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
      outlineButtonTheme: ShadButtonTheme(
        shadows: AppBoxShadows.xs,
        textStyle: AppTypography.titleSmall,
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.foreground,
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: colorScheme.border,
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
      ghostButtonTheme: ShadButtonTheme(
        textStyle: AppTypography.titleSmall,
        foregroundColor: colorScheme.foreground,
        backgroundColor: Colors.transparent,
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: Colors.transparent,
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
      linkButtonTheme: ShadButtonTheme(
        foregroundColor: colorScheme.primary,
        textStyle: AppTypography.titleMedium.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
      destructiveButtonTheme: ShadButtonTheme(
        shadows: AppBoxShadows.xs,
        textStyle: AppTypography.titleSmall,
        foregroundColor: colorScheme.destructiveForeground,
        backgroundColor: colorScheme.destructive,
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: Colors.transparent,
            width: 1,
            radius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
      checkboxTheme: ShadCheckboxTheme(
        color: colorScheme.primary,
        uncheckedColor: colorScheme.secondary,
        size: 16.r,
        checkboxPadding: EdgeInsets.zero,
        padding: EdgeInsetsDirectional.only(start: 6.w),
      ),
    );
  }

  // --- Material Themes ---
  static ThemeData get themeLight => _buildMaterialTheme(
    colorScheme: lightColorScheme,
    brightness: Brightness.light,
  );

  static ThemeData get themeDark => _buildMaterialTheme(
    colorScheme: darkColorScheme,
    brightness: Brightness.dark,
  );

  static ThemeData _buildMaterialTheme({
    required ShadColorScheme colorScheme,
    required Brightness brightness,
  }) {
    final isDark = brightness == Brightness.dark;
    final baseTheme = isDark ? ThemeData.dark() : ThemeData.light();

    return baseTheme.copyWith(
      scaffoldBackgroundColor: colorScheme.background,
      tabBarTheme: TabBarThemeData(
        overlayColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.transparent;
          }
          return null;
        }),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: colorScheme.primary.withValues(alpha: 0.3),
        selectionHandleColor: colorScheme.primary,
        cursorColor: colorScheme.primary,
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.displayLarge.copyWith(
          color: colorScheme.foreground,
        ),
        displayMedium: AppTypography.displayMedium.copyWith(
          color: colorScheme.foreground,
        ),
        displaySmall: AppTypography.displaySmall.copyWith(
          color: colorScheme.foreground,
        ),
        headlineLarge: AppTypography.headlineLarge.copyWith(
          color: colorScheme.foreground,
        ),
        headlineMedium: AppTypography.headlineMedium.copyWith(
          color: colorScheme.foreground,
        ),
        headlineSmall: AppTypography.headlineSmall.copyWith(
          color: colorScheme.foreground,
        ),
        titleLarge: AppTypography.titleLarge.copyWith(
          color: colorScheme.foreground,
        ),
        titleMedium: AppTypography.titleMedium.copyWith(
          color: colorScheme.foreground,
        ),
        titleSmall: AppTypography.titleSmall.copyWith(
          color: colorScheme.foreground,
        ),
        bodyLarge: AppTypography.bodyLarge.copyWith(
          color: colorScheme.foreground,
        ),
        bodyMedium: AppTypography.bodyMedium.copyWith(
          color: colorScheme.foreground,
        ),
        bodySmall: AppTypography.bodySmall.copyWith(
          color: colorScheme.mutedForeground,
        ),
        labelLarge: AppTypography.labelLarge.copyWith(
          color: colorScheme.foreground,
        ),
        labelMedium: AppTypography.labelMedium.copyWith(
          color: colorScheme.foreground,
        ),
        labelSmall: AppTypography.labelSmall.copyWith(
          color: colorScheme.mutedForeground,
        ),
      ),
      extensions: [
        MaterialPinThemeExtension(
          theme: MaterialPinTheme(
            shape: MaterialPinShape.outlined,
            cellSize: Size(48.r, 48.r),
            textStyle: AppTypography.headlineMedium.copyWith(
              color: colorScheme.foreground,
            ),
            spacing: 8.w,
            borderRadius: BorderRadius.all(AppBorderRadiuses.roundedBase),
            borderWidth: 1,
            focusedBorderWidth: 1,
            borderColor: colorScheme.border,
            filledBorderColor: colorScheme.border,
            focusedBorderColor: colorScheme.primary,
            fillColor: colorScheme.secondary,
            focusedFillColor: colorScheme.secondary,
            filledFillColor: colorScheme.secondary,
            errorFillColor: colorScheme.destructive.withValues(alpha: 0.1),
            errorBorderColor: colorScheme.destructive.withValues(alpha: 0.5),
            errorTextStyle: AppTypography.headlineMedium.copyWith(
              color: colorScheme.destructive,
            ),
            entryAnimation: MaterialPinAnimation.fade,
            cursorColor: colorScheme.foreground,
          ),
        ),
      ],
    );
  }
}

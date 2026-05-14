import 'package:flutter/material.dart';
import 'package:paiting_by_numbers/app/ui/theme/typography/app_font_sizes.dart';
import 'package:paiting_by_numbers/app/ui/theme/typography/app_font_weights.dart';

abstract class AppTypography {
  // Headlines

  /// - size: 60(xl6)
  /// - weight: 800(extra-bold)
  /// - color: text-heading
  static final TextStyle displayLarge = TextStyle(
    fontSize: AppFontSizes.xl6,
    fontWeight: AppFontWeights.extraBold,
    letterSpacing: 0,
  );

  /// - size: 48(xl5)
  /// - weight: 700(bold)
  /// - color: text-heading
  static final TextStyle displayMedium = TextStyle(
    fontSize: AppFontSizes.xl5,
    fontWeight: AppFontWeights.bold,
    letterSpacing: 0,
  );

  /// - size: 36(xl4)
  /// - weight: 600(semibold)
  /// - color: text-heading
  static final TextStyle displaySmall = TextStyle(
    fontSize: AppFontSizes.xl4,
    fontWeight: AppFontWeights.semibold,
    letterSpacing: 0,
  );

  /// - size: 30(xl3)
  /// - weight: 700(bold)
  /// - color: text-body
  static final TextStyle headlineLarge = TextStyle(
    fontSize: AppFontSizes.xl3,
    fontWeight: AppFontWeights.bold,
    letterSpacing: 0,
  );

  /// - size: 24(xl2)
  /// - weight: 600(semibold)
  /// - color: text-heading
  static final TextStyle headlineMedium = TextStyle(
    fontSize: AppFontSizes.xl2,
    fontWeight: AppFontWeights.semibold,
    letterSpacing: 0,
  );

  /// - size: 20(xl)
  /// - weight: 600(semibold)
  /// - color: text-heading
  static final TextStyle headlineSmall = TextStyle(
    fontSize: AppFontSizes.xl,
    fontWeight: AppFontWeights.semibold,
    letterSpacing: 0,
  );

  // Titles

  /// - size: 18(lg)
  /// - weight: 700(bold)
  /// - color: text-heading
  static final TextStyle titleLarge = TextStyle(
    fontSize: AppFontSizes.lg,
    fontWeight: AppFontWeights.bold,
    letterSpacing: 0,
  );

  /// - size: 16(base)
  /// - weight: 600(semibold)
  /// - color: text-heading
  static final TextStyle titleMedium = TextStyle(
    fontSize: AppFontSizes.base,
    fontWeight: AppFontWeights.semibold,
    letterSpacing: 0,
  );

  /// - size: 14(sm)
  /// - weight: 500(medium)
  /// - color: text-heading
  static final TextStyle titleSmall = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: AppFontWeights.medium,
    letterSpacing: 0,
  );

  // Body

  /// - size: 16(base)
  /// - weight: 400(regular)
  /// - color: text-body
  static final TextStyle bodyLarge = TextStyle(
    fontSize: AppFontSizes.base,
    fontWeight: AppFontWeights.regular,
    letterSpacing: 0,
  );

  /// - size: 14(sm)
  /// - weight: 400(regular)
  /// - color: text-body
  static final TextStyle bodyMedium = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: AppFontWeights.regular,
    letterSpacing: 0,
  );

  /// - size: 12(xs)
  /// - weight: 400(regular)
  /// - color: text-body-soft
  static final TextStyle bodySmall = TextStyle(
    fontSize: AppFontSizes.xs,
    fontWeight: AppFontWeights.regular,
    letterSpacing: 0,
  );

  // Labels

  /// - size: 14(sm)
  /// - weight: 500
  /// - color: text-body
  static final TextStyle labelLarge = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: AppFontWeights.medium,
    letterSpacing: 0,
  );

  /// - size: 12(xs)
  /// - weight: 500(medium)
  /// - color: text-body
  static final TextStyle labelMedium = TextStyle(
    fontSize: AppFontSizes.xs,
    fontWeight: AppFontWeights.medium,
    letterSpacing: 0,
  );

  /// - size: 8
  /// - weight: 500(medium)
  /// - color: text-body-soft
  static final TextStyle labelSmall = TextStyle(
    fontSize: AppFontSizes.xxs,
    fontWeight: AppFontWeights.medium,
    letterSpacing: 0,
  );
}

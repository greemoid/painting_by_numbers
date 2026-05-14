import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppBoxShadows {
  static List<BoxShadow> get top => [
    BoxShadow(
      color: const Color(0xFF131C34).withValues(alpha: 0.1),
      offset: const Offset(0, -1),
      blurRadius: 14.r,
    ),
  ];

  static List<BoxShadow> get xs => [
    BoxShadow(
      color: const Color(0xFF1D293D).withValues(alpha: 0.02),
      offset: const Offset(0, 1),
      blurRadius: 0.5.r,
      spreadRadius: 0.05.r,
    ),
  ];

  static List<BoxShadow> get md => [
    BoxShadow(
      color: const Color(0xFF1D293D).withValues(alpha: 0.10),
      offset: const Offset(0, 2),
      blurRadius: 4.r,
      spreadRadius: -2.r,
    ),
  ];

  static List<BoxShadow> get lg => [
    BoxShadow(
      color: const Color(0xFF1D293D).withValues(alpha: 0.10),
      offset: const Offset(0, 10),
      blurRadius: 15.r,
      spreadRadius: -3.r,
    ),
    BoxShadow(
      color: const Color(0xFF1D293D).withValues(alpha: 0.10),
      offset: const Offset(0, 4),
      blurRadius: 6.r,
      spreadRadius: -4.r,
    ),
  ];

  static List<BoxShadow> get bottomDropdown => [
    BoxShadow(
      color: const Color(0xFF131C34).withValues(alpha: 0.1),
      offset: const Offset(0, 1),
      blurRadius: 14.r,
      spreadRadius: 0,
    ),
  ];
}

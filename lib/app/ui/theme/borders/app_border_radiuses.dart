import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppBorderRadiuses {
  static Radius get rounded0 => Radius.circular(0.r);

  static Radius get roundedXxs => Radius.circular(2.r);

  static Radius get roundedXs => Radius.circular(4.r);

  static Radius get roundedSm => Radius.circular(6.r);

  static Radius get rounded => Radius.circular(8.r);

  static Radius get roundedBase => Radius.circular(12.r);

  static Radius get roundedLg => Radius.circular(16.r);

  static Radius get roundedXl => Radius.circular(20.r);

  static Radius get rounded2xl => Radius.circular(24.r);

  static Radius get rounded3xl => Radius.circular(32.r);

  static Radius get roundedFull => Radius.circular(9999.r);
}

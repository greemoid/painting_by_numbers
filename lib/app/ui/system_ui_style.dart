import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class SystemUiStyle {
  static const main = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
  );
}

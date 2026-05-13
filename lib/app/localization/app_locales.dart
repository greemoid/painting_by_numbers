import 'package:flutter/material.dart';

abstract final class AppLocales {
  static const supportedLocales = <Locale>[Locale('en'), Locale('uk')];

  static const fallbackLocale = Locale('en');

  static const translationsPath = 'assets/translations';
}

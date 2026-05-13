import 'package:flutter/material.dart';

abstract final class AppLocales {
  static const supportedLocales = <Locale>[
    Locale('en'),
    Locale('de'),
    Locale('fr'),
    Locale('it'),
  ];

  static const fallbackLocale = Locale('en');

  static const translationsPath = 'assets/translations';
}

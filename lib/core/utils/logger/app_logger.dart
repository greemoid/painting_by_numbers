import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

class AppLogger {
  static void debug(String message, {String? tag}) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag]' : '[AppLogger]';
      developer.log('$prefix $message', name: 'AppLogger');
    }
  }

  static void info(String message, {String? tag}) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag]' : '[AppLogger]';
      developer.log('$prefix $message', name: 'AppLogger', level: 800);
    }
  }

  static void warning(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag]' : '[AppLogger]';
      developer.log(
        '$prefix $message',
        name: 'AppLogger',
        level: 900,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  static void error(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag]' : '[AppLogger]';
      developer.log(
        '$prefix $message',
        name: 'AppLogger',
        level: 1000,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

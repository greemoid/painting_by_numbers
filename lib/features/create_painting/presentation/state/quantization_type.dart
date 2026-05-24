import 'package:easy_localization/easy_localization.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';

enum QuantizationType {
  many,
  few,
  custom;

  String get name {
    switch (this) {
      case QuantizationType.many:
        return LocaleKeys.create_painting_type_many.tr();
      case QuantizationType.few:
        return LocaleKeys.create_painting_type_few.tr();
      case QuantizationType.custom:
        return LocaleKeys.create_painting_type_custom.tr();
    }
  }

  int colorsCount([int? customValue]) {
    switch (this) {
      case QuantizationType.many:
        return 24;
      case QuantizationType.few:
        return 12;
      case QuantizationType.custom:
        return customValue ?? 25;
    }
  }
}

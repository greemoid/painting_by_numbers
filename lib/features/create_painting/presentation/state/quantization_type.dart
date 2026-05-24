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
}

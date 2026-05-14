import 'package:firebase_core/firebase_core.dart';
import 'package:paiting_by_numbers/core/cubits/base/dio_error_mapper.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';
import 'package:paiting_by_numbers/core/cubits/base/firebase_error_mapper.dart';

class FailureMapper {
  static Failure from(Object error) {
    if (error is FirebaseException) {
      return FirebaseErrorMapper.map(error);
    }
    return DioErrorMapper.map(error);
  }
}


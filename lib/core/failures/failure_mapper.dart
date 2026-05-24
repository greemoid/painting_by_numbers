import 'package:firebase_core/firebase_core.dart';
import 'package:paiting_by_numbers/core/failures/mappers/dio_error_mapper.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/failures/mappers/firebase_error_mapper.dart';
import 'package:paiting_by_numbers/core/failures/mappers/google_sign_in_error_mapper.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FailureMapper {
  static Failure from(Object error) {
    if (error is FirebaseException) {
      return FirebaseErrorMapper.map(error);
    }
    if (error is GoogleSignInException) {
      return GoogleSignInErrorMapper.map(error);
    }
    return DioErrorMapper.map(error);
  }
}

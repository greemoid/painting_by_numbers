import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';

abstract interface class FilePickerService {
  Future<Either<Failure, File>> pickImage({required ImageSource source});
}

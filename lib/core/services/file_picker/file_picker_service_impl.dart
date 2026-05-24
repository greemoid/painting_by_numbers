import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/services/file_picker/file_picker_constraints.dart';
import 'package:paiting_by_numbers/core/services/file_picker/file_picker_service.dart';

@LazySingleton(as: FilePickerService)
class FilePickerServiceImpl implements FilePickerService {
  final ImagePicker _imagePicker;

  FilePickerServiceImpl(this._imagePicker);

  @override
  Future<Either<Failure, File>> pickImage({required ImageSource source}) async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: source);
      if (image == null) return const Left(CanceledByUserFailure());

      final file = File(image.path);
      return await _validateFile(file);
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  Future<Either<Failure, File>> _validateFile(File file) async {
    final fileSize = await file.length();
    if (fileSize > FileConstraints.maxFileSizeInBytes) {
      return const Left(FileTooLargeFailure());
    }
    return Right(file);
  }
}

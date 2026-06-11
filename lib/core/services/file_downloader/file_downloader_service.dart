import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';

abstract interface class FileDownloaderService {
  /// Downloads an image from the network and returns the local File.
  Future<Either<Failure, File>> downloadImage(String url);
}

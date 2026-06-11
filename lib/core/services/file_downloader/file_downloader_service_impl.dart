import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/failures/failure_mapper.dart';
import 'package:paiting_by_numbers/core/services/file_downloader/file_downloader_service.dart';

@LazySingleton(as: FileDownloaderService)
class FileDownloaderServiceImpl implements FileDownloaderService {
  final Dio _dio;

  FileDownloaderServiceImpl(this._dio);

  @override
  Future<Either<Failure, File>> downloadImage(String url) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final uri = Uri.parse(url);
      var extension = uri.pathSegments.isNotEmpty
          ? uri.pathSegments.last.split('.').last.toLowerCase()
          : 'jpg';
      const allowedExtensions = {'jpg', 'jpeg', 'png', 'gif', 'webp', 'svg'};
      if (!allowedExtensions.contains(extension)) {
        extension = 'jpg';
      }
      final fileName =
          'downloaded_${DateTime.now().millisecondsSinceEpoch}.$extension';
      final filePath = '${tempDir.path}/$fileName';

      await _dio.download(url, filePath);
      return Right(File(filePath));
    } catch (e) {
      return Left(FailureMapper.from(e));
    }
  }
}

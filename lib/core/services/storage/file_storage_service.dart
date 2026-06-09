import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class FileStorageService {
  const FileStorageService();

  /// Saves the given string content (e.g. SVG) to a local file and returns its absolute path.
  Future<String> saveStringToFile({
    required String content,
    required String fileName,
  }) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(content);
    return file.path;
  }
}

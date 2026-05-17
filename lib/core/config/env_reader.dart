import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvReader {
  final Map<String, String> _env;
  final List<String> _missing = [];

  EnvReader() : _env = dotenv.env;

  String require(String key) {
    final value = _env[key];
    if (value == null || value.isEmpty) {
      _missing.add(key);
      return '';
    }
    return value;
  }

  void validate() {
    if (_missing.isNotEmpty) {
      throw StateError(
        'Missing required .env variables: ${_missing.join(', ')}',
      );
    }
  }
}

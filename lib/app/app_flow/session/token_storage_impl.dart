import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/app_flow/session/auth_tokens.dart';
import 'package:paiting_by_numbers/core/app_flow/session/token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@LazySingleton(as: TokenStorage)
class TokenStorageImpl implements TokenStorage {
  TokenStorageImpl(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    await _secureStorage.write(
      key: _accessTokenKey,
      value: tokens.accessToken,
    );
    await _secureStorage.write(
      key: _refreshTokenKey,
      value: tokens.refreshToken,
    );
  }

  @override
  Future<AuthTokens?> readTokens() async {
    final accessToken = await _secureStorage.read(key: _accessTokenKey);
    final refreshToken = await _secureStorage.read(key: _refreshTokenKey);

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }
}

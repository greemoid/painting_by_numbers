import 'package:paiting_by_numbers/core/app_flow/session/auth_tokens.dart';

/// Contract for persisting auth tokens.
abstract interface class TokenStorage {
  Future<void> saveTokens(AuthTokens tokens);

  Future<AuthTokens?> readTokens();

  Future<void> clearTokens();
}

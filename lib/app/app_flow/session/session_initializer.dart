import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/app_flow/session/session_manager.dart';

/// Restores application session on app startup.
@lazySingleton
class SessionInitializer {
  SessionInitializer(this._sessionManager);

  final SessionManager _sessionManager;

  Future<void> call() {
    return _sessionManager.restoreSession();
  }
}

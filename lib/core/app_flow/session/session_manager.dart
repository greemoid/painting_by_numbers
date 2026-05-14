import 'package:paiting_by_numbers/core/app_flow/session/session_status.dart';

/// Contract for controlling and observing application session lifecycle.
abstract interface class SessionManager {
  SessionStatus get currentSessionStatus;

  Future<void> restoreSession();

  void dispose();
}

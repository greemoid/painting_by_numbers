import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/app/app_flow/session/session_cubit.dart';
import 'package:paiting_by_numbers/core/app_flow/session/auth_tokens.dart';
import 'package:paiting_by_numbers/core/app_flow/session/session_manager.dart';
import 'package:paiting_by_numbers/core/app_flow/session/session_status.dart';
import 'package:paiting_by_numbers/core/app_flow/session/token_storage.dart';

@LazySingleton(as: SessionManager)
class SessionManagerImpl implements SessionManager {
  final SessionCubit _sessionCubit;
  final TokenStorage _tokenStorage;

  SessionManagerImpl(this._sessionCubit, this._tokenStorage);

  @override
  SessionStatus get currentSessionStatus => _sessionCubit.state;

  @override
  Future<void> restoreSession() async {
    _sessionCubit.setStatus(SessionStatus.unknown);

    final AuthTokens? tokens = await _tokenStorage.readTokens();

    if (tokens == null) {
      _sessionCubit.setStatus(SessionStatus.unauthenticated);
    } else {
      // TODO: Here you could also verify the token with Firebase if needed
      _sessionCubit.setStatus(SessionStatus.authenticated);
    }
  }

  @override
  Future<void> openSession(AuthTokens tokens) async {
    await _tokenStorage.saveTokens(tokens);
    _sessionCubit.setStatus(SessionStatus.authenticated);
  }

  @override
  Future<void> closeSession() async {
    await _tokenStorage.clearTokens();
    _sessionCubit.setStatus(SessionStatus.unauthenticated);
  }
}

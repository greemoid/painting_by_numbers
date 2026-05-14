import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/app/app_flow/session/session_cubit.dart';
import 'package:paiting_by_numbers/core/app_flow/session/session_manager.dart';
import 'package:paiting_by_numbers/core/app_flow/session/session_status.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/get_current_user_use_case.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/watch_auth_state_use_case.dart';

@LazySingleton(as: SessionManager)
class SessionManagerImpl implements SessionManager {
  final SessionCubit _sessionCubit;
  final WatchAuthStateUseCase _watchAuthStateUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  StreamSubscription? _authSubscription;

  SessionManagerImpl(
    this._sessionCubit,
    this._watchAuthStateUseCase,
    this._getCurrentUserUseCase,
  );

  @override
  SessionStatus get currentSessionStatus => _sessionCubit.state;

  @override
  Future<void> restoreSession() async {
    _sessionCubit.setStatus(SessionStatus.unknown);

    final currentUser = _getCurrentUserUseCase();
    if (currentUser != null) {
      _sessionCubit.setStatus(SessionStatus.authenticated);
    } else {
      _sessionCubit.setStatus(SessionStatus.unauthenticated);
    }

    _authSubscription?.cancel();
    _authSubscription = _watchAuthStateUseCase().listen((user) {
      if (user != null) {
        _sessionCubit.setStatus(SessionStatus.authenticated);
      } else {
        _sessionCubit.setStatus(SessionStatus.unauthenticated);
      }
    });
  }

  @override
  @disposeMethod
  void dispose() {
    _authSubscription?.cancel();
  }
}

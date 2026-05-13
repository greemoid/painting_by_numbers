import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/app_flow/session/session_status.dart';

@lazySingleton
class SessionCubit extends Cubit<SessionStatus> {
  SessionCubit() : super(SessionStatus.unknown);

  void setStatus(SessionStatus status) => emit(status);
}

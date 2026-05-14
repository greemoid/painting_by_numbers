import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/app/app_flow/app_flow_resolver.dart';
import 'package:paiting_by_numbers/app/app_flow/session/session_cubit.dart';
import 'package:paiting_by_numbers/core/app_flow/app_flow.dart';

@lazySingleton
class AppFlowCubit extends Cubit<AppFlow> {
  final SessionCubit _sessionCubit;
  late final StreamSubscription _sessionSub;

  AppFlowCubit(this._sessionCubit) : super(AppFlow.auth) {
    _sessionSub = _sessionCubit.stream.listen((_) => _resolve());
    _resolve();
  }

  void _resolve() {
    final flow = AppFlowResolver.resolve(session: _sessionCubit.state);
    if (state != flow) {
      emit(flow);
    }
  }

  @override
  Future<void> close() {
    _sessionSub.cancel();
    return super.close();
  }
}

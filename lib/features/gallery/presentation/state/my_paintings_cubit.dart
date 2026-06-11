import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/features/gallery/domain/repositories/painting_repository.dart';
import 'package:paiting_by_numbers/features/gallery/presentation/state/my_paintings_state.dart';

@injectable
class MyPaintingsCubit extends BaseCubit<MyPaintingsState> {
  final PaintingRepository _repository;
  final FirebaseAuth _firebaseAuth;
  StreamSubscription? _subscription;

  MyPaintingsCubit(
    this._repository,
    this._firebaseAuth,
    FailureNotifier failureNotifier,
  ) : super(const MyPaintingsState.initial(), failureNotifier) {
    _init();
  }

  void _init() {
    safeEmit(const MyPaintingsState.loading());
    final userId = _firebaseAuth.currentUser?.uid ?? 'guest';
    
    _subscription = _repository.watchMyPaintings(userId).listen(
      (paintings) {
        safeEmit(MyPaintingsState.data(items: paintings));
      },
      onError: (error) {
        final failure = error is Failure ? error : const UnknownFailure();
        safeEmit(MyPaintingsState.error(failure));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

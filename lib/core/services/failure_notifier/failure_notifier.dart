import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';

@lazySingleton
class FailureNotifier {
  final _failureController = StreamController<Failure>.broadcast();

  Stream<Failure> get failureStream => _failureController.stream;

  void notify(Failure failure) {
    _failureController.add(failure);
  }

  void dispose() {
    _failureController.close();
  }
}

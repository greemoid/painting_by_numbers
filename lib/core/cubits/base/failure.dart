import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';

abstract class Failure {
  final String messageKey;

  const Failure({required this.messageKey});
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super(messageKey: LocaleKeys.failure_network);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure()
    : super(messageKey: LocaleKeys.failure_unauthorized);
}

class ServerFailure extends Failure {
  const ServerFailure() : super(messageKey: LocaleKeys.failure_server);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super(messageKey: LocaleKeys.failure_not_found);
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super(messageKey: LocaleKeys.failure_unknown);
}

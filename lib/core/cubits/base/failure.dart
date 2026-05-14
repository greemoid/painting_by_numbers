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

class InvalidCredentialFailure extends Failure {
  const InvalidCredentialFailure()
    : super(messageKey: LocaleKeys.failure_invalid_credential);
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure()
    : super(messageKey: LocaleKeys.failure_user_not_found);
}

class WrongPasswordFailure extends Failure {
  const WrongPasswordFailure()
    : super(messageKey: LocaleKeys.failure_wrong_password);
}

class EmailAlreadyInUseFailure extends Failure {
  const EmailAlreadyInUseFailure()
    : super(messageKey: LocaleKeys.failure_email_already_in_use);
}

class UserDisabledFailure extends Failure {
  const UserDisabledFailure()
    : super(messageKey: LocaleKeys.failure_user_disabled);
}

class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure()
    : super(messageKey: LocaleKeys.failure_weak_password);
}

class OperationNotAllowedFailure extends Failure {
  const OperationNotAllowedFailure()
    : super(messageKey: LocaleKeys.failure_operation_not_allowed);
}

class TooManyRequestsFailure extends Failure {
  const TooManyRequestsFailure()
    : super(messageKey: LocaleKeys.failure_too_many_requests);
}

import 'package:equatable/equatable.dart';
/// Failures for the domain layer
/// Follows the Either pattern from dartz package
abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => <Object?>[message, statusCode];

  @override
  String toString() => '$runtimeType: $message (code: $statusCode)';
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.statusCode});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.statusCode});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message, super.statusCode});
}


class ValidationFailure extends Failure {
  const ValidationFailure({required super.message, super.statusCode});
}

class AuthFailure extends Failure {
  const AuthFailure({required super.message, super.statusCode});
}

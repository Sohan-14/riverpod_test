
import '../../../../core/entities/result.dart';
import '../../../../core/exceptions/failures.dart';
import '../repositories/auth_repository.dart';

/// Use case for signing out a user
class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  /// Call method to make the use case callable
  Future<Result<void, Failure>> call() {
    return repository.signOut();
  }
}
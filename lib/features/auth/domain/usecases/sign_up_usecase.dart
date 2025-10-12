import '../../../../core/entities/result.dart';
import '../../../../core/exceptions/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for signing up a new user
class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  /// Call method to make the use case callable
  Future<Result<User, Failure>> call({
    required String name,
    required String email,
    required String password,
  }) {
    return repository.signUp(
      name: name,
      email: email,
      password: password,
    );
  }
}
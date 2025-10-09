
import '../../../../core/entities/result.dart';
import '../../../../core/exceptions/failures.dart';
import '../repositories/auth_repo.dart';

/// Use case for resetting a password with a token
class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  /// Call method to make the use case callable
  Future<Result<void,Failure>> call({
    required String token,
    required String password,
  }) {
    return repository.resetPassword(token: token, password: password);
  }
}
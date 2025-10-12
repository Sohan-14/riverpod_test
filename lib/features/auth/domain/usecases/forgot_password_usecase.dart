import '../../../../core/entities/result.dart';
import '../../../../core/exceptions/failures.dart';
import '../repositories/auth_repository.dart';

/// Use case for sending a password reset email
class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  /// Call method to make the use case callable
  Future<Result<void, Failure>> call({required String email}) {
    return repository.forgotPassword(email: email);
  }
}
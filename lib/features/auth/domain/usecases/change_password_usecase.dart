
import '../../../../core/entities/result.dart';
import '../../../../core/exceptions/failures.dart';
import '../repositories/auth_repo.dart';

/// Use case for changing a password when authenticated
class ChangePasswordUseCase {
  final AuthRepository repository;

  ChangePasswordUseCase(this.repository);

  /// Call method to make the use case callable
  Future<Result<void, Failure>> call({
    required String currentPassword,
    required String newPassword,
  }) {
    return repository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
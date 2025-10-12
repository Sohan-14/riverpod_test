import '../../../../core/entities/result.dart';
import '../../../../core/exceptions/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Result<User, Failure>> call({
    required String email,
    required String password,
  }) {
    return repository.signIn(email: email, password: password);
  }
}
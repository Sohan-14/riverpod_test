import '../../../../core/entities/result.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInUsecase {
  final AuthRepository repository;

  SignInUsecase(this.repository);

  Future<Result<User>> call({
    required String email,
    required String password,
  }) {
    return repository.signIn(email: email, password: password);
  }
}

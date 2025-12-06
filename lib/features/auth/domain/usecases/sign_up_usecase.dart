import '../../../../core/entities/result.dart';
import '../entities/sign_up_req.dart';
import '../repositories/auth_repository.dart';

class SignUpUsecase {
  final AuthRepository repository;

  SignUpUsecase(this.repository);

  Future<Result<String>> call({required SignUpReq signUpReq}) {
    return repository.signUp(signUpReq: signUpReq);
  }
}
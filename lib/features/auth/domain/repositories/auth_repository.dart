import '../../../../core/entities/result.dart';
import '../entities/sign_up_req.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Result<User>> signIn({required String email, required String password});
  Future<Result<String>> signUp({required SignUpReq signUpReq});
  Future<void> logout();
  Future<bool> isLoggedIn();
}
import '../../domain/entities/sign_up_req.dart';
import '../model/sign_in_response.dart';
import '../model/sign_up_response.dart';

abstract class AuthRemoteDataSource {
  Future<SignInResponse> signIn({required String email, required  String password});
  Future<SignUpResponse> signUp({required SignUpReq signUpReq});
  Future<void> logout();
}

import '../../models/auth/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> signIn({
    required String email,
    required String password,
  });

  Future<AuthResponseModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> forgotPassword({
    required String email,
  });

  Future<void> resetPassword({
    required String token,
    required String password,
  });

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<void> signOut();
}
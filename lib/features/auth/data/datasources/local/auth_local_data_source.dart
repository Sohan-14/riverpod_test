import '../../models/user/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });
  
  Future<UserModel?> getUser();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  
  Future<void> clearAuth();
  Future<bool> isSignedIn();
}
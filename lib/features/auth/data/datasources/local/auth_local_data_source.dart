import '../../models/user/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<void> cacheTokens({
    required String accessToken,
    required String refreshToken,
  });
  
  Future<UserModel?> getUser();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  
  Future<void> clearCache();
  Future<bool> isSignedIn();
}
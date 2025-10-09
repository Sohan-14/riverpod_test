import '../../../../../core/constants/storage_keys.dart';
import '../../../../../core/exceptions/exceptions.dart';
import '../../../../../core/storage/local/local_storage.dart';
import '../../../../../core/storage/secure/secure_token_storage.dart';
import '../../../../../core/utils/app_logger.dart';
import '../../models/user/user_model.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureTokenStorage secureTokenStorage;
  final LocalStorage localStorage;

  AuthLocalDataSourceImpl({
    required this.secureTokenStorage,
    required this.localStorage,
  });

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      AppLogger().d('Caching user data: ${user.email}');
      await localStorage.saveData(StorageKeys.currentUser, user.toJson());
    } catch (e) {
      AppLogger().e('Error caching user data', error: e);
      throw LocalStorageException(message: 'Failed to cache user data: $e');
    }
  }

  @override
  Future<void> cacheTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      AppLogger().d('Caching auth tokens');
      await secureTokenStorage.saveAccessToken(accessToken);
      await secureTokenStorage.saveRefreshToken(refreshToken);
    } catch (e) {
      AppLogger().e('Error caching tokens', error: e);
      throw TokenException(message: 'Failed to cache tokens: $e');
    }
  }

  @override
  Future<UserModel?> getUser() async {
    try {
      AppLogger().d('Getting cached user data');
      final Map<String, dynamic>? userData = await localStorage
          .getData<Map<String, dynamic>>(StorageKeys.currentUser);
      if (userData != null) {
        return UserModel.fromJson(userData);
      }
      return null;
    } catch (e) {
      AppLogger().e('Error getting cached user', error: e);
      throw LocalStorageException(message: 'Failed to get cached user: $e');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      return await secureTokenStorage.getAccessToken();
    } catch (e) {
      AppLogger().e('Error getting access token', error: e);
      throw TokenException(message: 'Failed to get access token: $e');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return await secureTokenStorage.getRefreshToken();
    } catch (e) {
      AppLogger().e('Error getting refresh token', error: e);
      throw TokenException(message: 'Failed to get refresh token: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      AppLogger().d('Clearing user cache');
      await secureTokenStorage.deleteTokens();
      await localStorage.deleteData(StorageKeys.currentUser);
    } catch (e) {
      AppLogger().e('Error clearing cache', error: e);
      throw TokenException(message: 'Failed to clear cache: $e');
    }
  }

  @override
  Future<bool> isSignedIn() async {
    try {
      return await secureTokenStorage.hasAccessToken();
    } catch (e) {
      AppLogger().e('Error checking auth status', error: e);
      throw TokenException(message: 'Error checking auth status: $e');
    }
  }
}

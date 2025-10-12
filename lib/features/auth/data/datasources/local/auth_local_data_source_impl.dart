import '../../../../../core/constants/database_constants.dart';
import '../../../../../core/exceptions/exceptions.dart';
import '../../../../../core/storage/database_helper.dart';
import '../../../../../core/storage/secure/secure_token_storage.dart';
import '../../../../../core/utils/app_logger.dart';
import '../../models/user/user_model.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureTokenStorage secureTokenStorage;
  final DatabaseHelper databaseHelper;

  AuthLocalDataSourceImpl({
    required this.secureTokenStorage,
    required this.databaseHelper,
  });

  @override
  Future<void> saveUser(UserModel user) async {
    try {
      AppLogger().d('Saving user data: ${user.email}');
      await databaseHelper.insert(
        DatabaseConstants.userTable,
        user.toDatabase(),
      );
    } catch (e) {
      AppLogger().e('Error saving user data', error: e);
      throw DatabaseException(message: 'Failed to save user data: $e');
    }
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      AppLogger().d('Saving auth tokens');
      await secureTokenStorage.saveAccessToken(accessToken);
      await secureTokenStorage.saveRefreshToken(refreshToken);
    } catch (e) {
      AppLogger().e('Error saving tokens', error: e);
      throw DatabaseException(message: 'Failed to save tokens: $e');
    }
  }

  @override
  Future<UserModel?> getUser() async {
    try {
      AppLogger().d('Getting user data from database');
      final List<Map<String, dynamic>> users = await databaseHelper
          .queryAllRows(DatabaseConstants.userTable);

      if (users.isNotEmpty) {
        return UserModel.fromDatabase(users.first);
      }

      return null;
    } catch (e) {
      AppLogger().e('Error getting user data', error: e);
      throw DatabaseException(message: 'Failed to get user data: $e');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      return await secureTokenStorage.getAccessToken();
    } catch (e) {
      AppLogger().e('Error getting access token', error: e);
      throw DatabaseException(message: 'Failed to get access token: $e');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return await secureTokenStorage.getRefreshToken();
    } catch (e) {
      AppLogger().e('Error getting refresh token', error: e);
      throw DatabaseException(message: 'Failed to get refresh token: $e');
    }
  }

  @override
  Future<void> clearAuth() async {
    try {
      AppLogger().d('Clearing auth data');
      await secureTokenStorage.deleteTokens();
      await databaseHelper.deleteAll(DatabaseConstants.userTable);
    } catch (e) {
      AppLogger().e('Error clearing auth data', error: e);
      throw DatabaseException(message: 'Failed to clear auth data: $e');
    }
  }

  @override
  Future<bool> isSignedIn() async {
    try {
      return await secureTokenStorage.hasAccessToken();
    } catch (e) {
      AppLogger().e('Error checking auth status', error: e);
      throw DatabaseException(message: 'Error checking auth status: $e');
    }
  }
}

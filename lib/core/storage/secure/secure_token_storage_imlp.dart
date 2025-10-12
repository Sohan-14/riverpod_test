import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../constants/storage_keys.dart';
import '../../exceptions/exceptions.dart';
import '../../utils/app_logger.dart';
import 'secure_token_storage.dart';

/// [SecureTokenStorageImpl ] Implementation of secure token storage using flutter_secure_storage
class SecureTokenStorageImpl implements SecureTokenStorage {
  final FlutterSecureStorage _storage;

  SecureTokenStorageImpl (this._storage);

  @override
  Future<void> saveAccessToken(String token) async {
    try {
      AppLogger().d('Saving access token');
      await _storage.write(key: StorageKeys.accessToken, value: token);
    } catch (e) {
      AppLogger().e('Error saving access token', error: e);
      throw TokenException(message: 'Failed to save access token: $e');
    }
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    try {
      AppLogger().d('Saving refresh token');
      await _storage.write(key: StorageKeys.refreshToken, value: token);
    } catch (e) {
      AppLogger().e('Error saving refresh token', error: e);
      throw TokenException(message: 'Failed to save refresh token: $e');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      AppLogger().d('Getting access token');
      return await _storage.read(key: StorageKeys.accessToken);
    } catch (e) {
      AppLogger().e('Error getting access token', error: e);
      throw TokenException(message: 'Failed to get access token: $e');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      AppLogger().d('Getting refresh token');
      return await _storage.read(key: StorageKeys.refreshToken);
    } catch (e) {
      AppLogger().e('Error getting refresh token', error: e);
      throw TokenException(message: 'Failed to get refresh token: $e');
    }
  }

  @override
  Future<void> deleteTokens() async {
    try {
      AppLogger().d('Deleting auth tokens');
      await _storage.delete(key: StorageKeys.accessToken);
      await _storage.delete(key: StorageKeys.refreshToken);
    } catch (e) {
      AppLogger().e('Error deleting tokens', error: e);
      throw TokenException(message: 'Failed to delete tokens: $e');
    }
  }

  @override
  Future<bool> hasAccessToken() async {
    try {
      AppLogger().d('Checking if access token exists');
      final String? token = await getAccessToken();
      return token != null && token.isNotEmpty;
    } catch (e) {
      AppLogger().e('Error checking access token', error: e);
      return false;
    }
  }
}

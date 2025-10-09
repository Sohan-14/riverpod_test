/// [StorageKeys] Centralized storage keys to avoid duplication and typos
class StorageKeys {
  StorageKeys._();
  // Secure storage keys (sensitive data)
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  
  // storage keys (non-sensitive data)
  static const String themeMode = 'theme_mode';
  static const String currentUser = 'current_user';
  static const String appSettings = 'app_settings';
}
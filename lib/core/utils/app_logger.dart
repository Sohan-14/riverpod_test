import 'dart:developer' as developer;

enum LogLevel { debug, info, warning, error }

/// [AppLogger] Custom logger with emoji support for better visualization
class AppLogger {
  // Static variable to hold the single instance
  static AppLogger? _instance;

  // Private constructor to prevent external instantiation
  AppLogger._internal();

  // Public factory constructor that returns the same instance
  factory AppLogger() {
    _instance ??= AppLogger._internal();
    return _instance!;
  }

  bool enableLogs = true;

  void d(String message) {
    _log(LogLevel.debug, message);
  }

  void i(String message) {
    _log(LogLevel.info, message);
  }

  void w(String message) {
    _log(LogLevel.warning, message);
  }

  void e(String message, {Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.error, message, error: error, stackTrace: stackTrace);
  }

  void _log(
    LogLevel level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!enableLogs){
       return;
    }

    final String emoji = _getLevelEmoji(level);
    final String timestamp = DateTime.now().toIso8601String();
    final String formattedMessage = '$emoji $timestamp\n$message';

    developer.log(
      formattedMessage,
      name: level.name.toUpperCase(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  String _getLevelEmoji(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return '🐞';
      case LogLevel.info:
        return 'ℹ️️';
      case LogLevel.warning:
        return '⚠️';
      case LogLevel.error:
        return '❌';
    }
  }
}

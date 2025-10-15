/// Route paths for the app
class RoutePaths {
  // Auth routes
  static const String initial = '/';

  static const String login = '/sign-in';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String verifyEmail = '/verify-email';
  
  // App routes
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  
  // Nested routes
  static const String changePassword = '/settings/change-password';
}
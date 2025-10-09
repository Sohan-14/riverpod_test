import '../constants/api_constants.dart';

/// [ApiEndpoints] API endpoints for the app
class ApiEndpoints {
  ApiEndpoints._();
  // Auth endpoints
  static const String login = '${ApiConstants.baseUrl}/auth/login';
  static const String register = '${ApiConstants.baseUrl}/auth/register';
  static const String forgotPassword = '${ApiConstants.baseUrl}/auth/forgot-password';
  static const String resetPassword = '${ApiConstants.baseUrl}/auth/reset-password';
  static const String changePassword = '${ApiConstants.baseUrl}/auth/change-password';
  static const String refreshToken = '${ApiConstants.baseUrl}/auth/refresh-token';
  static const String logout = '${ApiConstants.baseUrl}/auth/logout';
  
  // User endpoints
  static const String userProfile = '${ApiConstants.baseUrl}/user/profile';
  static const String updateProfile = '${ApiConstants.baseUrl}/user/profile/update';
  
}
import '../constants/api_constants.dart';

/// [ApiEndpoints] API endpoints for the app
class ApiEndpoints {
  ApiEndpoints._();
  // Auth endpoints
  static const String register = '${ApiConstants.baseUrl}/auth/signup';
  static const String verifyOtp = '${ApiConstants.baseUrl}/auth/verify_otp';
  static const String login = '${ApiConstants.baseUrl}/auth/signin';
  static const String forgotPassword =
      '${ApiConstants.baseUrl}/auth/forgot_password';
  static const String resetPassword =
      '${ApiConstants.baseUrl}/auth/reset_password';

//----------------------------------------------------------------------//
  static const String changePassword =
      '${ApiConstants.baseUrl}/auth/change-password';
  static const String refreshToken =
      '${ApiConstants.baseUrl}/auth/refresh-token';
  static const String logout = '${ApiConstants.baseUrl}/auth/logout';

  // User endpoints
  static const String userProfile = '${ApiConstants.baseUrl}/user/profile';
  static const String updateProfile =
      '${ApiConstants.baseUrl}/user/update-profile';
}

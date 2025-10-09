import '../../../../../core/api/api_client.dart';
import '../../../../../core/api/api_endpoints.dart';
import '../../../../../core/exceptions/exceptions.dart';
import '../../../../../core/utils/app_logger.dart';
import '../../models/auth/auth_response_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<AuthResponseModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      AppLogger().i('Attempting sign in for: $email');
      final AuthResponseModel response = await apiClient
          .handleRequest<AuthResponseModel>(
            endpoint: ApiEndpoints.login,
            data: <String, String>{
              'email': email,
              'password': password,
            },
            httpMethod: HttpMethod.post,
            fromJson: AuthResponseModel.fromJson,
          );

      AppLogger().i('Sign in successful for: $email');
      return response;
    } catch (e) {
      AppLogger().e('Sign in failed: $e');
      if (e is ServerException) {
        throw AuthException(
          message: e.message,
          statusCode: e.statusCode,
        );
      }
      rethrow;
    }
  }

  @override
  Future<AuthResponseModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      AppLogger().i('Attempting sign up for: $email');
      final AuthResponseModel response = await apiClient
          .handleRequest<AuthResponseModel>(
            httpMethod: HttpMethod.post,
            endpoint: ApiEndpoints.register,
            data: <String, String>{
              'name': name,
              'email': email,
              'password': password,
            },
            fromJson: AuthResponseModel.fromJson,
          );

      AppLogger().i('Sign up successful for: $email');
      return response;
    } catch (e) {
      AppLogger().e('Sign up failed: $e');
      if (e is ServerException) {
        throw AuthException(
          message: e.message,
          statusCode: e.statusCode,
        );
      }
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      AppLogger().i('Sending forgot password request for: $email');
      await apiClient.handleRequest<Map<String, dynamic>>(
        httpMethod: HttpMethod.post,
        endpoint: ApiEndpoints.forgotPassword,
        data: <String, String>{
          'email': email,
        },
      );
      AppLogger().i('Forgot password request sent for: $email');
    } catch (e) {
      AppLogger().e('Forgot password failed: $e');
      if (e is ServerException) {
        throw AuthException(
          message: e.message,
          statusCode: e.statusCode,
        );
      }
      rethrow;
    }
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String password,
  }) async {
    try {
      AppLogger().i('Attempting password reset');
      await apiClient.handleRequest<Map<String, dynamic>>(
        httpMethod: HttpMethod.post,
        endpoint: ApiEndpoints.resetPassword,
        data: <String, String>{
          'token': token,
          'password': password,
        },
      );
      AppLogger().i('Password reset successful');
    } catch (e) {
      AppLogger().e('Password reset failed: $e');
      if (e is ServerException) {
        throw AuthException(
          message: e.message,
          statusCode: e.statusCode,
        );
      }
      rethrow;
    }
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      AppLogger().i('Attempting to change password');
      await apiClient.handleRequest<Map<String, dynamic>>(
        httpMethod: HttpMethod.post,
        endpoint: ApiEndpoints.changePassword,
        data: <String, String>{
          'current_password': currentPassword,
          'new_password': newPassword,
        },
      );
      AppLogger().i('Password change successful');
    } catch (e) {
      AppLogger().e('Password change failed: $e');
      if (e is ServerException) {
        throw AuthException(
          message: e.message,
          statusCode: e.statusCode,
        );
      }
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      AppLogger().i('Signing out');
      await apiClient.handleRequest<Map<String, dynamic>>(
        httpMethod: HttpMethod.post,
        endpoint: ApiEndpoints.logout
      );
      AppLogger().i('Sign out successful');
    } catch (e) {
      AppLogger().e('Sign out failed: $e');
      if (e is ServerException) {
        throw AuthException(
          message: e.message,
          statusCode: e.statusCode,
        );
      }
      rethrow;
    }
  }
}

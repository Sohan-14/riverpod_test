import 'package:dio/dio.dart';

import '../../constants/api_constants.dart';
import '../../storage/secure/secure_token_storage.dart';
import '../../utils/app_logger.dart';

/// [AuthInterceptor] Interceptor to add authorization headers to requests
class AuthInterceptor extends Interceptor {
  final SecureTokenStorage tokenStorage;

  AuthInterceptor({required this.tokenStorage});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await tokenStorage.getAccessToken();

    if (token != null) {
      AppLogger().d('Adding auth token to request');
      options.headers[ApiConstants.authHeaderKey] =
          '${ApiConstants.bearerPrefix}$token';
    }

    super.onRequest(options, handler);
  }
}

import 'package:app/core/constants/storage_keys.dart';
import 'package:app/core/storage/secure_storage_service.dart';
import 'package:dio/dio.dart';

import '../../constants/api_constants.dart';
import '../../utils/app_logger.dart';

/// [AuthInterceptor] Interceptor to add authorization headers to requests
class AuthInterceptor extends Interceptor {
  final SecureStorageService secureStorage;

  AuthInterceptor({required this.secureStorage});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await secureStorage.read(StorageKeys.accessToken);

    if (token != null) {
      AppLogger().d('Adding auth token to request');
      options.headers[ApiConstants.authHeaderKey] =
          '${ApiConstants.bearerPrefix}$token';
    }

    super.onRequest(options, handler);
  }
}

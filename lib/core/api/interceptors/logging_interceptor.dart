import 'package:dio/dio.dart';
import '../../utils/app_logger.dart';

/// [LoggingInterceptor] Interceptor for logging API requests and responses
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final String? token = await SecureStorageService().read(
    //   AppConstants.authToken,
    // );
    // final String? verificationToken = await SecureStorageService()
    //     .read(
    //       AppConstants.verificationToken,
    //     );
    // if (verificationToken != null && verificationToken.isNotEmpty) {
    //   options.headers['Authorization'] = 'Bearer $verificationToken';
    // } else if (token != null && token.isNotEmpty) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }

    AppLogger().d(
      <String, dynamic>{
        'Method': options.method,
        'Uri': options.uri,
        'Headers': options.headers,
        "queryParameters": options.queryParameters,
        'Data': options.data,
      }.toString(),
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    AppLogger().i(
      "onResponse: ${response.statusCode} ${response.data}",
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger().e("onError: ${err.response?.statusCode} ${err.message}", error: err,);
    super.onError(err, handler);
  }
}

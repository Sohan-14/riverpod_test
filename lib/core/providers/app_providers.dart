import 'package:app/core/storage/secure_storage_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/api_client.dart';
import '../api/interceptors/auth_interceptor.dart';
import '../api/interceptors/logging_interceptor.dart';


/// [connectivityProvider]
 
/// [authInterceptorProvider]
/// [loggingInterceptorProvider]

/// [dioProvider]
/// [apiClientProvider]


//* ------------------------------------ Connectivity Providers ------------------------------------
final Provider<Connectivity> connectivityProvider = Provider<Connectivity>(
  (
    Ref ref,
  ) => Connectivity(),
);


//* ------------------------------------ Secure Storage Providers ------------------------------------
final Provider<FlutterSecureStorage> secureStorageProvider =
    Provider<FlutterSecureStorage>((Ref ref) => const FlutterSecureStorage());



//* ------------------------------------ Interceptors Providers ------------------------------------
final Provider<AuthInterceptor> authInterceptorProvider =
    Provider<AuthInterceptor>(
      (Ref ref) => AuthInterceptor(secureStorage: SecureStorageService()),
    );

final Provider<LoggingInterceptor> loggingInterceptorProvider =
    Provider<LoggingInterceptor>((Ref ref) => LoggingInterceptor());


//* ------------------------------------ Network Providers ------------------------------------
final Provider<Dio> dioProvider = Provider<Dio>((Ref ref) {
  return Dio()
    ..options.connectTimeout = const Duration(seconds: 15)
    ..options.receiveTimeout = const Duration(seconds: 15);
});

//* ------------------------------------ Api Client Providers ------------------------------------
final Provider<ApiClient> apiClientProvider = Provider<ApiClient>((Ref ref) {
  final Dio dio = ref.watch(dioProvider);
  final AuthInterceptor authInterceptor = ref.watch(authInterceptorProvider);
  final LoggingInterceptor loggingInterceptor = ref.watch(
    loggingInterceptorProvider,
  );
  return ApiClient(
    dio: dio,
    authInterceptor: authInterceptor,
    loggingInterceptor: loggingInterceptor,
  );
});
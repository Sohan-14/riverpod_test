import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/api_client.dart';
import '../api/interceptors/auth_interceptor.dart';
import '../api/interceptors/logging_interceptor.dart';
import '../storage/secure/secure_token_storage_impl.dart';


/// [connectivityProvider]
/// [secureStorageProvider]
/// [secureTokenStorageProvider]
 
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

//* ------------------------------------ Secure Token Storage Providers ------------------------------------
final Provider<SecureTokenStorageImpl> secureTokenStorageProvider =
    Provider<SecureTokenStorageImpl>((Ref ref) {
      final FlutterSecureStorage secureStorage = ref.watch(
        secureStorageProvider,
      );
      return SecureTokenStorageImpl(secureStorage);
    });



//* ------------------------------------ Interceptors Providers ------------------------------------
final Provider<AuthInterceptor> authInterceptorProvider =
    Provider<AuthInterceptor>(
      (Ref ref) => AuthInterceptor(
        tokenStorage: ref.watch(
          secureTokenStorageProvider,
        ),
      ),
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
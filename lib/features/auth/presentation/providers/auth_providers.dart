// lib/features/auth/presentation/providers/auth_providers.dart
import 'package:app/core/entities/result.dart';
import 'package:app/core/exceptions/failures.dart';
import 'package:app/features/auth/domain/entities/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/api/interceptors/logging_interceptor.dart';
import '../../../../core/api/interceptors/auth_interceptor.dart';
import '../../../../core/storage/local/local_storage.dart';
import '../../../../core/storage/secure/secure_token_storage.dart';
import '../../data/datasources/local/auth_local_data_source.dart';
import '../../data/datasources/local/auth_local_data_source_impl.dart';
import '../../data/datasources/remote/auth_remote_data_source.dart';
import '../../data/datasources/remote/auth_remote_data_source_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../domain/usecases/forgot_password_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/change_password_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../../../core/utils/app_logger.dart';
import 'state/auth_state.dart';

part 'auth_providers.g.dart';

// External dependencies
final Provider<Dio> dioProvider = Provider<Dio>((Ref ref) {
  return Dio();
});

final Provider<LoggingInterceptor> loggingInterceptorProvider =
    Provider<LoggingInterceptor>((Ref ref) {
      return LoggingInterceptor();
    });

final Provider<AuthInterceptor> authInterceptorProvider =
    Provider<AuthInterceptor>((Ref ref) {
      final tokenStorage = ref.watch(secureTokenStorageProvider);
      return AuthInterceptor(tokenStorage: tokenStorage);
    });

final Provider<ApiClient> apiClientProvider = Provider<ApiClient>((Ref ref) {
  final Dio dio = ref.watch(dioProvider);
  final LoggingInterceptor loggingInterceptor = ref.watch(
    loggingInterceptorProvider,
  );
  final AuthInterceptor authInterceptor = ref.watch(authInterceptorProvider);

  return ApiClient(
    dio: dio,
    loggingInterceptor: loggingInterceptor,
    authInterceptor: authInterceptor,
  );
});

final Provider<Connectivity> connectivityProvider = Provider<Connectivity>((
  Ref ref,
) {
  return Connectivity();
});

// Storage providers - initialized in main.dart
final Provider<dynamic> secureTokenStorageProvider =
    Provider<SecureTokenStorage>((Ref ref) {
      throw UnimplementedError('Initialized in main.dart');
    });

final Provider<dynamic> localStorageProvider = Provider<LocalStorage>((
  Ref ref,
) {
  throw UnimplementedError('Initialized in main.dart');
});

// Data sources
final Provider<dynamic> authRemoteDataSourceProvider =
    Provider<AuthRemoteDataSource>((Ref ref) {
      return AuthRemoteDataSourceImpl(apiClient: ref.watch(apiClientProvider));
    });

final Provider<dynamic> authLocalDataSourceProvider =
    Provider<AuthLocalDataSource>((Ref ref) {
      return AuthLocalDataSourceImpl(
        secureTokenStorage: ref.watch(secureTokenStorageProvider),
        localStorage: ref.watch(localStorageProvider),
      );
    });

// Repository
final Provider<dynamic> authRepositoryProvider = Provider<AuthRepository>((
  Ref ref,
) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
    connectivity: ref.watch(connectivityProvider),
  );
});

// Use cases
final Provider<SignInUseCase> signInUseCaseProvider = Provider<SignInUseCase>((
  Ref ref,
) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
});

final Provider<SignUpUseCase> signUpUseCaseProvider = Provider<SignUpUseCase>((
  Ref ref,
) {
  return SignUpUseCase(ref.watch(authRepositoryProvider));
});

final Provider<ForgotPasswordUseCase> forgotPasswordUseCaseProvider =
    Provider<ForgotPasswordUseCase>((Ref ref) {
      return ForgotPasswordUseCase(ref.watch(authRepositoryProvider));
    });

final Provider<ResetPasswordUseCase> resetPasswordUseCaseProvider =
    Provider<ResetPasswordUseCase>((Ref ref) {
      return ResetPasswordUseCase(ref.watch(authRepositoryProvider));
    });

final Provider<ChangePasswordUseCase> changePasswordUseCaseProvider =
    Provider<ChangePasswordUseCase>((Ref ref) {
      return ChangePasswordUseCase(ref.watch(authRepositoryProvider));
    });

final Provider<SignOutUseCase> signOutUseCaseProvider =
    Provider<SignOutUseCase>((Ref ref) {
      return SignOutUseCase(ref.watch(authRepositoryProvider));
    });

// Auth controller with state notifier
@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    _checkAuthStatus();
    return const AuthState.initial();
  }

  /// Check if user is authenticated
  Future<void> _checkAuthStatus() async {
    state = const AuthState.loading();
    AppLogger().i('AuthController: Checking authentication status');

    final authRepository = ref.watch(authRepositoryProvider);
    final result = await authRepository.isSignedIn();

    await result.fold(
      (failure) {
        AppLogger().e(
          'AuthController: Auth status check failed: ${failure.message}',
        );
        state = AuthState.error(failure.message);
      },
      (isSignedIn) async {
        if (isSignedIn) {
          AppLogger().i(
            'AuthController: User is signed in, retrieving user data',
          );
          final userResult = await authRepository.getCurrentUser();
          userResult.fold(
            (failure) {
              AppLogger().e(
                'AuthController: Error getting user data: ${failure.message}',
              );
              state = AuthState.error(failure.message);
            },
            (user) {
              if (user != null) {
                AppLogger().i(
                  'AuthController: User authenticated: ${user.email}',
                );
                state = AuthState.authenticated(user);
              } else {
                AppLogger().i(
                  'AuthController: No user data found, setting to unauthenticated',
                );
                state = const AuthState.unauthenticated();
              }
            },
          );
        } else {
          AppLogger().i('AuthController: User is not signed in');
          state = const AuthState.unauthenticated();
        }
      },
    );
  }

  /// Sign in a user with email and password
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    AppLogger().i('AuthController: Attempting sign in for: $email');

    final SignInUseCase signInUseCase = ref.read(signInUseCaseProvider);
    final Result<User, Failure> result = await signInUseCase(
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        AppLogger().e('AuthController: Sign in failed: ${failure.message}');
        state = AuthState.error(failure.message);
      },
      (user) {
        AppLogger().i('AuthController: Sign in successful for: ${user.email}');
        state = AuthState.authenticated(user);
      },
    );
  }

  /// Sign up a new user
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    AppLogger().i('AuthController: Attempting sign up for: $email');

    final SignUpUseCase signUpUseCase = ref.read(signUpUseCaseProvider);
    final Result<User, Failure> result = await signUpUseCase(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        AppLogger().e('AuthController: Sign up failed: ${failure.message}');
        state = AuthState.error(failure.message);
      },
      (user) {
        AppLogger().i('AuthController: Sign up successful for: ${user.email}');
        state = AuthState.authenticated(user);
      },
    );
  }

  /// Send a password reset email
  Future<void> forgotPassword({required String email}) async {
    state = const AuthState.loading();
    AppLogger().i('AuthController: Sending forgot password email to: $email');

    final ForgotPasswordUseCase forgotPasswordUseCase = ref.read(
      forgotPasswordUseCaseProvider,
    );
    final Result<void, Failure> result = await forgotPasswordUseCase(
      email: email,
    );

    result.fold(
      (failure) {
        AppLogger().e(
          'AuthController: Forgot password failed: ${failure.message}',
        );
        state = AuthState.error(failure.message);
      },
      (_) {
        AppLogger().i('AuthController: Forgot password email sent to: $email');
        state = const AuthState.unauthenticated();
      },
    );
  }

  /// Reset password using a token
  Future<void> resetPassword({
    required String token,
    required String password,
  }) async {
    state = const AuthState.loading();
    AppLogger().i('AuthController: Resetting password with token');

    final ResetPasswordUseCase resetPasswordUseCase = ref.read(
      resetPasswordUseCaseProvider,
    );
    final Result<void, Failure> result = await resetPasswordUseCase(
      token: token,
      password: password,
    );

    result.fold(
      (failure) {
        AppLogger().e(
          'AuthController: Password reset failed: ${failure.message}',
        );
        state = AuthState.error(failure.message);
      },
      (_) {
        AppLogger().i('AuthController: Password reset successful');
        state = const AuthState.unauthenticated();
      },
    );
  }

  /// Change password when authenticated
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = const AuthState.loading();
    AppLogger().i('AuthController: Changing password');

    final ChangePasswordUseCase changePasswordUseCase = ref.read(
      changePasswordUseCaseProvider,
    );
    final Result<void, Failure> result = await changePasswordUseCase(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    result.fold(
      (failure) {
        AppLogger().e(
          'AuthController: Password change failed: ${failure.message}',
        );
        state = AuthState.error(failure.message);
      },
      (_) {
        AppLogger().i('AuthController: Password change successful');
        _checkAuthStatus();
      },
    );
  }

  /// Sign out the current user
  Future<void> signOut() async {
    state = const AuthState.loading();
    AppLogger().i('AuthController: Signing out');

    final SignOutUseCase signOutUseCase = ref.read(signOutUseCaseProvider);
    final Result<void, Failure> result = await signOutUseCase();

    result.fold(
      (failure) {
        AppLogger().e('AuthController: Sign out failed: ${failure.message}');
        state = AuthState.error(failure.message);
      },
      (_) {
        AppLogger().i('AuthController: Sign out successful');
        state = const AuthState.unauthenticated();
      },
    );
  }
}

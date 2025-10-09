import 'package:app/features/auth/data/models/auth/auth_response_model.dart';
import 'package:app/features/auth/data/models/user/user_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../../core/entities/result.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../core/utils/app_logger.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../datasources/remote/auth_remote_data_source.dart';

/// Implementation of the auth repository
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final Connectivity connectivity;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<Result<User, Failure>> signIn({
    required String email,
    required String password,
  }) async {
    if (await _isConnected()) {
      try {
        AppLogger().i('Repository: Signing in user with email $email');
        final AuthResponseModel authResponse = await remoteDataSource.signIn(
          email: email,
          password: password,
        );

        await localDataSource.cacheTokens(
          accessToken: authResponse.accessToken,
          refreshToken: authResponse.refreshToken,
        );

        await localDataSource.cacheUser(authResponse.user);

        AppLogger().i('Repository: Sign in successful');
        return Result<User, Failure>.success(authResponse.user.toEntity());
      } on AuthException catch (e) {
        AppLogger().e(
          'Repository: Auth exception during sign in: ${e.message}',
        );
        return Result<User, Failure>.failure(
          AuthFailure(
            message: e.message,
            statusCode: e.statusCode,
          ),
        );
      } on ServerException catch (e) {
        AppLogger().e(
          'Repository: Server exception during sign in: ${e.message}',
        );
        return Result<User, Failure>.failure(
          ServerFailure(
            message: e.message,
            statusCode: e.statusCode,
          ),
        );
      } catch (e) {
        AppLogger().e('Repository: Unexpected error during sign in: $e');
        return Result<User, Failure>.failure(
          ServerFailure(message: e.toString()),
        );
      }
    } else {
      AppLogger().w('Repository: No internet connection for sign in');
      return Result<User, Failure>.failure(
        const NetworkFailure(message: 'No internet connection'),
      );
    }
  }

  @override
  Future<Result<User, Failure>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    if (await _isConnected()) {
      try {
        AppLogger().i('Repository: Signing up user with email $email');
        final AuthResponseModel authResponse = await remoteDataSource.signUp(
          name: name,
          email: email,
          password: password,
        );

        await localDataSource.cacheTokens(
          accessToken: authResponse.accessToken,
          refreshToken: authResponse.refreshToken,
        );

        await localDataSource.cacheUser(authResponse.user);

        AppLogger().i('Repository: Sign up successful');
        return Result<User, Failure>.success(authResponse.user.toEntity());
      } on AuthException catch (e) {
        AppLogger().e(
          'Repository: Auth exception during sign up: ${e.message}',
        );
        return Result<User, Failure>.failure(
          AuthFailure(
            message: e.message,
            statusCode: e.statusCode,
          ),
        );
      } on ServerException catch (e) {
        AppLogger().e(
          'Repository: Server exception during sign up: ${e.message}',
        );
        return Result<User, Failure>.failure(
          ServerFailure(
            message: e.message,
            statusCode: e.statusCode,
          ),
        );
      } catch (e) {
        AppLogger().e('Repository: Unexpected error during sign up: $e');
        return Result<User, Failure>.failure(
          ServerFailure(message: e.toString()),
        );
      }
    } else {
      AppLogger().w('Repository: No internet connection for sign up');
      return Result<User, Failure>.failure(
        const NetworkFailure(message: 'No internet connection'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> forgotPassword({
    required String email,
  }) async {
    if (await _isConnected()) {
      try {
        AppLogger().i('Repository: Sending forgot password request for $email');
        await remoteDataSource.forgotPassword(email: email);
        AppLogger().i('Repository: Forgot password request sent');
        return Result<User, Failure>.success(null);
      } on AuthException catch (e) {
        AppLogger().e(
          'Repository: Auth exception during forgot password: ${e.message}',
        );
        return Result<User, Failure>.failure(
          AuthFailure(
            message: e.message,
            statusCode: e.statusCode,
          ),
        );
      } on ServerException catch (e) {
        AppLogger().e(
          'Repository: Server exception during forgot password: ${e.message}',
        );
        return Result<User, Failure>.failure(
          ServerFailure(
            message: e.message,
            statusCode: e.statusCode,
          ),
        );
      } catch (e) {
        AppLogger().e(
          'Repository: Unexpected error during forgot password: $e',
        );
        return Result<User, Failure>.failure(
          ServerFailure(message: e.toString()),
        );
      }
    } else {
      AppLogger().w('Repository: No internet connection for forgot password');
      return Result<User, Failure>.failure(
        const NetworkFailure(message: 'No internet connection'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> resetPassword({
    required String token,
    required String password,
  }) async {
    if (await _isConnected()) {
      try {
        AppLogger().i('Repository: Resetting password');
        await remoteDataSource.resetPassword(
          token: token,
          password: password,
        );
        AppLogger().i('Repository: Password reset successful');
        return Result<void, Failure>.success(null);
      } on AuthException catch (e) {
        AppLogger().e(
          'Repository: Auth exception during reset password: ${e.message}',
        );
        return Result<void, Failure>.failure(
          AuthFailure(
            message: e.message,
            statusCode: e.statusCode,
          ),
        );
      } on ServerException catch (e) {
        AppLogger().e(
          'Repository: Server exception during reset password: ${e.message}',
        );
        return Result<void, Failure>.failure(
          ServerFailure(
            message: e.message,
            statusCode: e.statusCode,
          ),
        );
      } catch (e) {
        AppLogger().e('Repository: Unexpected error during reset password: $e');
        return Result<void, Failure>.failure(
          ServerFailure(message: e.toString()),
        );
      }
    } else {
      AppLogger().w('Repository: No internet connection for reset password');
      return Result<void, Failure>.failure(
        const NetworkFailure(message: 'No internet connection'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (await _isConnected()) {
      try {
        AppLogger().i('Repository: Changing password');
        await remoteDataSource.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
        AppLogger().i('Repository: Password change successful');
        return Result<void, Failure>.success(null);
      } on AuthException catch (e) {
        AppLogger().e(
          'Repository: Auth exception during change password: ${e.message}',
        );
        return Result<void, Failure>.failure(
          AuthFailure(
            message: e.message,
            statusCode: e.statusCode,
          ),
        );
      } on ServerException catch (e) {
        AppLogger().e(
          'Repository: Server exception during change password: ${e.message}',
        );
        return Result<void, Failure>.failure(
          ServerFailure(
            message: e.message,
            statusCode: e.statusCode,
          ),
        );
      } catch (e) {
        AppLogger().e(
          'Repository: Unexpected error during change password: $e',
        );
        return Result<void, Failure>.failure(
          ServerFailure(message: e.toString()),
        );
      }
    } else {
      AppLogger().w('Repository: No internet connection for change password');
      return Result<void, Failure>.failure(
        const NetworkFailure(message: 'No internet connection'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> signOut() async {
    try {
      AppLogger().i('Repository: Signing out');
      if (await _isConnected()) {
        try {
          await remoteDataSource.signOut();
          AppLogger().i('Repository: Remote sign out successful');
        } catch (e) {
          // Even if remote sign out fails, we still clear local data
          AppLogger().w(
            'Repository: Remote sign out failed, proceeding with local sign out',
          );
        }
      }

      await localDataSource.clearCache();
      AppLogger().i('Repository: Local sign out successful');
      return Result<void, Failure>.success(null);
    } on TokenException catch (e) {
      AppLogger().e(
        'Repository: Cache exception during sign out: ${e.message}',
      );
      return Result<void, Failure>.failure(CacheFailure(message: e.message));
    } catch (e) {
      AppLogger().e('Repository: Unexpected error during sign out: $e');
      return Result<void, Failure>.failure(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Result<User?, Failure>> getCurrentUser() async {
    try {
      AppLogger().i('Repository: Getting current user from cache');
      final UserModel? user = await localDataSource.getUser();
      AppLogger().i('Repository: Current user retrieved: ${user?.email}');
      return Result<User?, Failure>.success(user?.toEntity());
    } on LocalStorageException catch (e) {
      AppLogger().e(
        'Repository: Cache exception getting current user: ${e.message}',
      );
      return Result<User?, Failure>.failure(CacheFailure(message: e.message));
    } catch (e) {
      AppLogger().e('Repository: Unexpected error getting current user: $e');
      return Result<User?, Failure>.failure(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Result<bool, Failure>> isSignedIn() async {
    try {
      AppLogger().i('Repository: Checking if user is signed in');
      final bool isSignedIn = await localDataSource.isSignedIn();
      AppLogger().i(
        'Repository: User is ${isSignedIn ? 'signed in' : 'not signed in'}',
      );
      return Result<bool, Failure>.success(isSignedIn);
    } catch (e) {
      AppLogger().e('Repository: Error checking auth status: $e');
      return Result<bool, Failure>.failure(
        const CacheFailure(message: 'Error checking auth status'),
      );
    }
  }

  Future<bool> _isConnected() async {
    final List<ConnectivityResult> connectivityResult = await connectivity
        .checkConnectivity();
    return connectivityResult.firstOrNull != ConnectivityResult.none;
  }
}

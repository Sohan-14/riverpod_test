import 'package:app/core/storage/secure/secure_token_storage.dart';
import 'package:app/features/auth/data/model/sign_in_response.dart';

import '../../../../core/entities/result.dart';
import '../../../../core/exceptions/exception_handler.dart';
import '../../domain/entities/sign_up_req.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../model/sign_up_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureTokenStorage secureTokenStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureTokenStorage,
  });

  @override
  Future<bool> isLoggedIn() {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // ✅ Call the remote data source to sign up
      final SignInResponse user = await remoteDataSource.signIn(
        email: email,
        password: password,
      );
      // ✅ Save token if your API returns one (e.g., data['token'])
      secureTokenStorage.saveAccessToken(user.token);
      return Result<User>.success(user as User);
    } catch (e) {
      return Result<User>.failure(ExceptionHandler.handleException(e));
    }
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> signUp({required SignUpReq signUpReq}) async {
    try {
      // ✅ Call the remote data source to sign up
      final SignUpResponse user = await remoteDataSource.signUp(
        signUpReq: signUpReq,
      );
      return Result<String>.success(user.email);
    } catch (e) {
      return Result<String>.failure(ExceptionHandler.handleException(e));
    }
  }
}

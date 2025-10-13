import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../features/auth/data/datasources/local/auth_local_data_source_impl.dart';
import '../../../../features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../controllers/login_controller.dart';
import '../controllers/password_reset_controller.dart';
import '../controllers/signup_controller.dart';
import '../states/login_state.dart';
import '../states/password_reset_state.dart';
import '../states/sign_up_state.dart';
import 'auth_notifier.dart';
import '../states/auth_state.dart';

// Remote Data Source Providers
final Provider<AuthRemoteDataSourceImpl> authRemoteDataSourceProvider =
    Provider<AuthRemoteDataSourceImpl>((Ref ref) {
      return AuthRemoteDataSourceImpl(apiClient: ref.watch(apiClientProvider));
    });

// Local data source providers
final Provider<AuthLocalDataSourceImpl> authLocalDataSourceProvider =
    Provider<AuthLocalDataSourceImpl>((
      Ref ref,
    ) {
      return AuthLocalDataSourceImpl(
        secureTokenStorage: ref.watch(
          secureTokenStorageProvider,
        ),
        databaseHelper: ref.watch(databaseHelperProvider),
      );
    });

// Repository Provider
final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>((Ref ref) {
      return AuthRepositoryImpl(
        remoteDataSource: ref.watch(
          authRemoteDataSourceProvider,
        ),
        localDataSource: ref.watch(
          authLocalDataSourceProvider,
        ),
        connectivity: ref.watch(connectivityProvider),
      );
    });

// 5. Notifier Provider
final NotifierProvider<AuthNotifier, AuthState> authProvider =
    NotifierProvider<AuthNotifier, AuthState>(() {
      return AuthNotifier();
    });



/// controllers 
final NotifierProvider<LoginController, LoginState> loginControllerProvider =
    NotifierProvider<LoginController, LoginState>(() {
      return LoginController();
    });

final NotifierProvider<SignupController, SignupState> signupControllerProvider =
    NotifierProvider<SignupController, SignupState>(() {
      return SignupController();
    });

final NotifierProvider<PasswordResetController, PasswordResetState>
passwordResetControllerProvider =
    NotifierProvider<PasswordResetController, PasswordResetState>(() {
      return PasswordResetController();
    });

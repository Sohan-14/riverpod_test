import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/sign_up_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../../../core/providers/app_providers.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/datasources/auth_remote_data_source_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../controllers/sign_up_controller.dart';
import '../state/sign_up_form_state.dart';

//* ------------------------------------ Auth Providers ------------------------------------ */
final Provider<AuthRemoteDataSource> authRemoteDataSourceProvider =
    Provider<AuthRemoteDataSource>(
      (Ref ref) => AuthRemoteDataSourceImpl(ref.read(apiClientProvider)),
    );

//* ------------------------------------ Repository Providers ------------------------------------ */
final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>(
      (Ref ref) => AuthRepositoryImpl(
        remoteDataSource: ref.read(authRemoteDataSourceProvider),
        secureTokenStorage: ref.read(secureTokenStorageProvider),
      ),
    );

//* ------------------------------------ Usecase Providers ------------------------------------ */
final Provider<SignOutUsecase> signOutUseCaseProvider =
    Provider<SignOutUsecase>(
      (Ref ref) => SignOutUsecase(ref.read(authRepositoryProvider)),
    );

final Provider<SignUpUsecase> signUpUseCaseProvider = Provider<SignUpUsecase>(
  (Ref ref) => SignUpUsecase(ref.read(authRepositoryProvider)),
);

final Provider<SignInUsecase> signInUseCaseProvider = Provider<SignInUsecase>(
  (Ref ref) => SignInUsecase(ref.read(authRepositoryProvider)),
);

//* ------------------------------------ Controller Providers ------------------------------------ */
final NotifierProvider<SignUpFormNotifier, SignUpFormState> signUpFormProvider =
    NotifierProvider<SignUpFormNotifier, SignUpFormState>(
      SignUpFormNotifier.new,
    );

import 'package:app/core/constants/storage_keys.dart';
import 'package:app/core/storage/secure_storage_service.dart';
import 'package:app/features/auth/data/model/sign_in_response.dart';
import 'package:app/features/auth/presentation/state/sign_in_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/providers/app_providers.dart';
import 'package:app/core/utils/toast/toast.dart';
import 'package:app/core/exceptions/exception_handler.dart';
import 'package:app/core/utils/app_logger.dart';
import 'package:app/core/utils/app_validation.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_endpoints.dart';
import '../../../../core/navigation/app_router.dart';

class SignInNotifier extends Notifier<SignInFormState> {
  @override
  SignInFormState build() => const SignInFormState();

  set setEmail(String value) {
    state = state.copyWith(
      email: value,
      emailError: AppValidation.validateEmail(value),
    );
  }

  set setPassword(String value) {
    state = state.copyWith(
      password: value,
      passwordError: value.isEmpty ? "Password is required" : null,
    );
  }

  Future<void> login() async {
    // Re-validate on submit
    final String? emailError = AppValidation.validateEmail(state.email);
    final String? passwordError = state.password.isEmpty
        ? "Password is required"
        : null;

    state = state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
      formError: null,
    );

    if (emailError != null || passwordError != null) {
      return;
    }

    state = state.copyWith(isSubmitting: true);

    try {
      final SignInResponse response = await ref
          .read(apiClientProvider)
          .handleRequest<SignInResponse>(
            httpMethod: HttpMethod.post,
            endpoint: ApiEndpoints.login,
            fromJson: SignInResponse.fromJson,
            data: <String, String>{
              "email": state.email,
              "password": state.password,
            },
          );

      final GoRouter router = ref.read(appRouterProvider);
      await SecureStorageService().write(
        StorageKeys.accessToken,
        response.tokens.accessToken,
      );
      if (response.data.interests.isEmpty) {
        router.go(RoutePaths.interest);
      } else {
        router.go(RoutePaths.bottomNav);
      }

      Toast.showSuccess(response.message);
    } catch (e) {
      final String message = ExceptionHandler.errorMessage(e);
      state = state.copyWith(formError: message);
      Toast.showError(message);
      AppLogger().e("Login Error", error: e);
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }

  Future<void> signInWithGoogle() async {
    Toast.showInfo("Google Sign-In not implemented yet");
  }
}

import 'package:app/core/api/api_client.dart';
import 'package:app/core/api/api_endpoints.dart';
import 'package:app/core/exceptions/exception_handler.dart';
import 'package:app/core/navigation/app_router.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/providers/app_providers.dart';
import 'package:app/core/utils/app_logger.dart';
import 'package:app/core/utils/app_validation.dart';
import 'package:app/core/utils/toast/toast.dart';
import 'package:app/features/auth/presentation/state/reset_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordNotifier extends Notifier<ResetPasswordState> {
  @override
  ResetPasswordState build() {
    return const ResetPasswordState();
  }

  // Just update the value — no validation on change
  set setNewPassword(String value) {
    state = state.copyWith(
      newPassword: value,
      newPasswordError: AppValidation.validatePassword(value),
      formError: null,
    );
  }

  set setConfirmPassword(String value) {
    state = state.copyWith(
      confirmPassword: value,
      confirmPasswordError: AppValidation.validatePassword(value),
      formError: null,
    );
  }

  Future<void> resetPassword(String email) async {
    // Step 1: Validate new password (strength, etc.)
    final String? newPasswordError = AppValidation.validatePassword(
      state.newPassword,
    );

    // Step 2: Validate confirm password — but only check if it's empty or matches
    String? confirmPasswordError;

    if (state.confirmPassword.isEmpty) {
      confirmPasswordError = "Please confirm your password";
    } else if (state.newPassword != state.confirmPassword) {
      confirmPasswordError = "Passwords do not match";
    }

    // Step 3: Update state with all errors
    state = state.copyWith(
      newPasswordError: newPasswordError,
      confirmPasswordError: confirmPasswordError,
      formError: null, // reset form-level error
    );

    // Step 4: If any field-level error exists, stop
    if (newPasswordError != null || confirmPasswordError != null) {
      return;
    }

    // Step 5: Proceed with API call
    state = state.copyWith(isSubmitting: true);

    try {
      final Map<String, dynamic> response = await ref
          .read(apiClientProvider)
          .handleRequest(
            httpMethod: HttpMethod.post,
            endpoint: ApiEndpoints.resetPassword,
            data: <String, String>{
              'email': email,
              'password': state.newPassword,
            },
          );

      Toast.showSuccess(response['message'] as String);
      final GoRouter router = ref.read(appRouterProvider);
      router.go(RoutePaths.login);
    } catch (e) {
      final String message = ExceptionHandler.errorMessage(e);
      state = state.copyWith(formError: message);
      Toast.showError(message);
      AppLogger().e("Reset Password Error", error: e);
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }
}

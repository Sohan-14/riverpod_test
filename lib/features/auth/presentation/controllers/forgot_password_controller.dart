import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/providers/app_providers.dart';
import 'package:app/core/utils/toast/toast.dart';
import 'package:app/core/exceptions/exception_handler.dart';
import 'package:app/core/utils/app_logger.dart';
import 'package:app/core/utils/app_validation.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_endpoints.dart';
import '../../../../core/navigation/app_router.dart';
import '../state/forgot_password_state.dart';

class ForgotPasswordNotifier extends Notifier<ForgotPasswordState> {
  @override
  ForgotPasswordState build() => const ForgotPasswordState();

  set setEmail(String value) {
    state = state.copyWith(
      email: value,
      emailError: AppValidation.validateEmail(value),
    );
  }

  Future<void> sendResetCode() async {
    // Re-validate on submit
    final String? emailError = AppValidation.validateEmail(state.email);
    state = state.copyWith(emailError: emailError, formError: null);

    if (emailError != null || state.email.isEmpty) {
      return;
    }

    state = state.copyWith(isSubmitting: true);

    try {
      final Map<String, dynamic> response = await ref
          .read(apiClientProvider)
          .handleRequest(
            httpMethod: HttpMethod.post,
            endpoint:
                ApiEndpoints.forgotPassword,
            data: <String, String>{'email': state.email},
          );

      Toast.showSuccess(response['message'] as String);
      ref
          .read(appRouterProvider)
          .push(
            RoutePaths.verifyEmail,
            extra: <String, String>{
              'type': 'forgot',
              'email': state.email,
            },
          );

    } catch (e) {
      final String message = ExceptionHandler.errorMessage(e);
      state = state.copyWith(formError: message);
      Toast.showError(message);
      AppLogger().e("Forgot Password Error", error: e);
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }
}

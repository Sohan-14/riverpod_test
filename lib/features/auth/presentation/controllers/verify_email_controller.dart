import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/providers/app_providers.dart';
import 'package:app/core/utils/toast/toast.dart';
import 'package:app/core/exceptions/exception_handler.dart';
import 'package:app/core/utils/app_logger.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_endpoints.dart';
import '../../../../core/navigation/app_router.dart';
import '../state/verify_email_form_state.dart';

class VerifyEmailNotifier extends Notifier<VerifyEmailState> {
  @override
  VerifyEmailState build() {
    return const VerifyEmailState();
  }

  set setOtp(String value) {
    final String? error = value.length == 6 ? null : "Enter a 6-digit code";
    state = state.copyWith(otp: value, otpError: error);
  }

  Future<void> verifyOtp({
    required String type,
    required String email,
  }) async {
    if (state.otp.length != 6) {
      state = state.copyWith(otpError: "Enter a 6-digit code");
      return;
    }

    state = state.copyWith(isSubmitting: true);
    try {
      final Map<String, dynamic> response = await ref
          .read(apiClientProvider)
          .handleRequest(
            httpMethod: HttpMethod.post,
            endpoint: ApiEndpoints.verifyOtp,
            data: <String, String>{"email": email, "oneTimeCode": state.otp},
          );

      Toast.showSuccess(response['message'] as String);

      final GoRouter router = ref.read(appRouterProvider);

      if (type == "forgot") {
        router.go(
          RoutePaths.resetPassword,
          extra: <String, String>{"email": email},
        );
      } else {
        // final Role role = ref.read(selectedRoleProvider);
        router.go(RoutePaths.login);
        // if (role == Role.seller) {
        //   router.go(RoutePaths.businessInfo);
        // } else if (role == Role.driver) {
        //   router.go(RoutePaths.vehicleInfo);
        // } else {
        //   router.go(RoutePaths.interest);
        // }
      }
    } catch (e) {
      Toast.showError(ExceptionHandler.errorMessage(e));
      AppLogger().e("OTP Verification Error", error: e);
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }

  Future<void> resendCode(String email) async {
    state = state.copyWith(isResending: true);
    try {
      final Map<String, dynamic> response = await ref
          .read(apiClientProvider)
          .handleRequest(
            httpMethod: HttpMethod.post,
            endpoint: ApiEndpoints.forgotPassword,
            data: <String, String>{"email": email},
          );
      Toast.showSuccess(response['message'] as String);
    } catch (e) {
      Toast.showError(ExceptionHandler.errorMessage(e));
      AppLogger().e("Resend OTP Error", error: e);
    } finally {
      state = state.copyWith(isResending: false);
    }
  }
}

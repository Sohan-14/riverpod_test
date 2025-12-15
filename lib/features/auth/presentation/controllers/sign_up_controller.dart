import 'package:app/core/navigation/app_router.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/providers/app_providers.dart';
import 'package:app/core/shared/provider/role_provider.dart';
import 'package:app/core/utils/toast/toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_endpoints.dart';
import '../../../../core/exceptions/exception_handler.dart';
import '../../../../core/utils/app_logger.dart';
import '../../../../core/utils/app_validation.dart';
import '../../data/model/sign_up_response.dart';
import '../../domain/entities/sign_up_req.dart';
import '../state/sign_up_form_state.dart';


class SignUpFormNotifier extends Notifier<SignUpFormState> {
  @override
  SignUpFormState build() => SignUpFormState();

  set setName(String value) {
    state = state.copyWith(
      name: value,
      nameTouched: true,
      nameError: AppValidation.validateRequired(value, fieldName: "User name"),
    );
    AppLogger().d('Name set to: ${state.name}, Error: ${state.nameError}');
  }

  set setEmail(String value) {
    state = state.copyWith(
      email: value,
      emailTouched: true,
      emailError: AppValidation.validateEmail(value),
    );
    AppLogger().d('Email set to: ${state.email}, Error: ${state.emailError}');
  }

  set setPassword(String value) {
    state = state.copyWith(
      password: value,
      passwordTouched: true,
      passwordError: AppValidation.validatePassword(
        value,
      ),
    );
    AppLogger().d(
      'Password set to: ${state.password}, Error: ${state.passwordError}',
    );
  }

  set setTermsAccepted(bool value) {
    state = state.copyWith(
      termsAccepted: value,
      termsTouched: true,
      termsError: AppValidation.validateBool(
        value,
        message: "You must accept the terms.",
      ),
    );
    AppLogger().d(
      'Terms set to: ${state.termsAccepted}, Error: ${state.termsError}',
    );
  }

  set setLocation(String? value) {
    state = state.copyWith(location: value);
    AppLogger().d('Location set to: ${state.location}');
  }

  set setDateOfBirth(DateTime? value) {
    state = state.copyWith(dateOfBirth: value);
    AppLogger().d('Date of Birth set to: ${state.dateOfBirth}');
  }

  void markNameTouched() {
    if (!state.nameTouched) {
      state = state.copyWith(
        nameTouched: true,
        nameError: AppValidation.validateRequired(
          state.name,
          fieldName: "User name",
        ),
      );
    }
  }

  void markEmailTouched() {
    if (!state.emailTouched) {
      state = state.copyWith(
        emailTouched: true,
        emailError: AppValidation.validateEmail(state.email),
      );
    }
  }

  void markPasswordTouched() {
    if (!state.passwordTouched) {
      state = state.copyWith(
        passwordTouched: true,
        passwordError: AppValidation.validatePassword(state.password),
      );
    }
  }

  void markTermsTouched() {
    if (!state.termsTouched) {
      state = state.copyWith(
        termsTouched: true,
        termsError: AppValidation.validateBool(
          state.termsAccepted,
          message: "You must accept the terms.",
        ),
      );
    }
  }

  Future<void> submitSignUp(WidgetRef ref) async {
    try {
      state = state.copyWith(
        nameError: AppValidation.validateRequired(
          state.name,
          fieldName: "User name",
        ),
        emailError: AppValidation.validateEmail(state.email),
        passwordError: AppValidation.validatePassword(state.password),
        termsError: AppValidation.validateBool(
          state.termsAccepted,
          message: "You must accept the terms.",
        ),
      );
      if (!state.isValid) {
        return;
      }

      state = state.copyWith(isSubmitting: true, formError: null);
      final SignUpReq data = SignUpReq(
        name: state.name,
        email: state.email,
        password: state.password,
        location: state.location,
        dateOfBirth: state.dateOfBirth,
        role: ref.read(selectedRoleProvider),
      );

      final SignUpResponse response = await ref
          .read(apiClientProvider)
          .handleRequest<SignUpResponse>(
            httpMethod: HttpMethod.post,
            endpoint: ApiEndpoints.register,
            fromJson: SignUpResponse.fromJson,
            data: data.toJson(),
          );

      state = state.copyWith(isSubmitting: false);
      ref
          .read(appRouterProvider)
          .go(
            RoutePaths.verifyEmail,
            extra: <String, Object>{"email": data.email, "type": "sign_up"},
          );

      Toast.showSuccess(response.message);
    } catch (e) {
      Toast.showError(ExceptionHandler.errorMessage(e));
      AppLogger().e("SignUp Error", error: e);
    }
    finally{
      state = state.copyWith(isSubmitting: false);
    }
  }
}

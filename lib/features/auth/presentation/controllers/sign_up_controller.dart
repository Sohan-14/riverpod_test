import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/entities/result.dart';
import '../../../../core/exceptions/exception_handler.dart';
import '../../../../core/utils/app_logger.dart';
import '../../../../core/utils/app_validation.dart';
import '../../domain/entities/sign_up_req.dart';
import '../providers/auth_providers.dart';
import '../state/sign_up_form_state.dart';

// In auth_providers.dart (or signup_form_notifier.dart)

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
      passwordError: AppValidation.validatePassword(value, ),
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
      state = state.copyWith(nameTouched: true, nameError: AppValidation.validateRequired(
        state.name,
        fieldName: "User name",
      ));
    }
  }

  void markEmailTouched() {
    if (!state.emailTouched) {
      state = state.copyWith(emailTouched: true, emailError: AppValidation.validateEmail(state.email));
    }
  }

  void markPasswordTouched() {
    if (!state.passwordTouched) {
      state = state.copyWith(passwordTouched: true, passwordError: AppValidation.validatePassword(state.password));
    }
  }

  void markTermsTouched() {
    if (!state.termsTouched) {
      state = state.copyWith(termsTouched: true, termsError: AppValidation.validateBool(
        state.termsAccepted,
        message: "You must accept the terms.",
      ));
    }
  }

  Future<void> submitSignUp(WidgetRef ref) async {
    state = state.copyWith(
      nameError: AppValidation.validateRequired(state.name, fieldName: "User name"),
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

    final Result<String> result = await ref
        .read(signUpUseCaseProvider)
        .call(
          signUpReq: SignUpReq(
            name: state.name,
            email: state.email,
            password: state.password,
            location: state.location,
            dateOfBirth: state.dateOfBirth,
          ),
        );

    state = state.copyWith(isSubmitting: false);

    if (result.isFailure) {
      state = state.copyWith(
        formError: result.data ?? ExceptionHandler.errorMessage(result.error),
      );
    }
    AppLogger().i('SignUp Result: ${result.data}, Error: ${result.error}');
    // Success: navigate or update global state
  }
}

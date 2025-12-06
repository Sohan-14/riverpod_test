import 'package:app/core/entities/result.dart';
import 'package:app/core/exceptions/exception_handler.dart';
import 'package:app/features/auth/domain/entities/sign_up_req.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_logger.dart';
import '../providers/auth_providers.dart';
import '../state/sign_up_form_state.dart';

// In auth_providers.dart (or signup_form_notifier.dart)

class SignUpFormNotifier extends Notifier<SignUpFormState> {
  @override
  SignUpFormState build() => SignUpFormState();

  set setName(String value) {
    state = state.copyWith(name: value, nameTouched: true);
    state = state.validateName();
  }

  set setEmail(String value) {
    state = state.copyWith(email: value, emailTouched: true);
    state = state.validateEmail();
  }

  set setPassword(String value) {
    state = state.copyWith(password: value, passwordTouched: true);
    state = state.validatePassword();
  }

  set setTermsAccepted(bool value) {
    state = state.copyWith(termsAccepted: value, termsTouched: true);
    state = state.validateTerms();
  }

  set setLocation(String? value) {
    state = state.copyWith(location: value);
  }

  set setDateOfBirth(DateTime? value) {
    state = state.copyWith(dateOfBirth: value);
  }

  // Called on field "blur" (optional: if you want validation only on blur)
  void markNameTouched() {
    if (!state.nameTouched) {
      state = state.copyWith(nameTouched: true).validateName();
    }
  }

  void markEmailTouched() {
    if (!state.emailTouched) {
      state = state.copyWith(emailTouched: true).validateEmail();
    }
  }

  void markPasswordTouched() {
    if (!state.passwordTouched) {
      state = state.copyWith(passwordTouched: true).validatePassword();
    }
  }

  void markTermsTouched() {
    if (!state.termsTouched) {
      state = state.copyWith(termsTouched: true).validateTerms();
    }
  }

  Future<void> submitSignUp(WidgetRef ref) async {
    state = state.validateAll();
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
      state = state.copyWith(formError: result.data ?? ExceptionHandler.errorMessage(result.error));
    }
    AppLogger().i('SignUp Result: ${result.data}, Error: ${result.error}');
    // Success: navigate or update global state
  }
}

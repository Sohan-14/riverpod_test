class SignupState {
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final bool isSubmitting;
  final bool formSubmitted;

  const SignupState({
    this.nameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.isSubmitting = false,
    this.formSubmitted = false,
  });

  SignupState copyWith({
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    bool? isSubmitting,
    bool? formSubmitted,
  }) {
    return SignupState(
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      formSubmitted: formSubmitted ?? this.formSubmitted,
    );
  }
}
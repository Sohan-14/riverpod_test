class LoginState {
  final String? emailError;
  final String? passwordError;
  final bool isSubmitting;
  final bool formSubmitted;

  const LoginState({
    this.emailError,
    this.passwordError,
    this.isSubmitting = false,
    this.formSubmitted = false,
  });

  LoginState copyWith({
    String? emailError,
    String? passwordError,
    bool? isSubmitting,
    bool? formSubmitted,
  }) {
    return LoginState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      formSubmitted: formSubmitted ?? this.formSubmitted,
    );
  }
}
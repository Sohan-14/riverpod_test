class ForgotPasswordState {
  final String email;
  final String? emailError;
  final bool isSubmitting;
  final String? formError;

  const ForgotPasswordState({
    this.email = '',
    this.emailError,
    this.isSubmitting = false,
    this.formError,
  });

  ForgotPasswordState copyWith({
    String? email,
    String? emailError,
    bool? isSubmitting,
    String? formError,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      emailError: emailError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      formError: formError,
    );
  }

  bool get isValid => emailError == null && email.isNotEmpty;
}

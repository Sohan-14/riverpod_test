class PasswordResetState {
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final String? codeError;
  final bool isSubmittingEmail;
  final bool isSubmittingReset;
  final bool emailSent;
  final bool resetComplete;

  const PasswordResetState({
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.codeError,
    this.isSubmittingEmail = false,
    this.isSubmittingReset = false,
    this.emailSent = false,
    this.resetComplete = false,
  });

  PasswordResetState copyWith({
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? codeError,
    bool? isSubmittingEmail,
    bool? isSubmittingReset,
    bool? emailSent,
    bool? resetComplete,
  }) {
    return PasswordResetState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      codeError: codeError ?? this.codeError,
      isSubmittingEmail: isSubmittingEmail ?? this.isSubmittingEmail,
      isSubmittingReset: isSubmittingReset ?? this.isSubmittingReset,
      emailSent: emailSent ?? this.emailSent,
      resetComplete: resetComplete ?? this.resetComplete,
    );
  }
}
class ResetPasswordState {
  final String newPassword;
  final String confirmPassword;
  final String? newPasswordError;
  final String? confirmPasswordError;
  final String? formError;
  final bool isSubmitting;

  const ResetPasswordState({
    this.newPassword = '',
    this.confirmPassword = '',
    this.newPasswordError,
    this.confirmPasswordError,
    this.formError,
    this.isSubmitting = false,
  });

  ResetPasswordState copyWith({
    String? newPassword,
    String? confirmPassword,
    String? newPasswordError,
    String? confirmPasswordError,
    String? formError,
    bool? isSubmitting,
  }) {
    return ResetPasswordState(
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      newPasswordError: newPasswordError,
      confirmPasswordError: confirmPasswordError,
      formError: formError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  bool get isValid =>
      newPassword.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      newPasswordError == null &&
      confirmPasswordError == null;

  @override
  String toString() {
    return "newPassword = $newPassword || confirmPassword = $confirmPassword || newPasswordError = $newPasswordError || confirmPasswordError = $confirmPasswordError || formError = $formError || isSubmitting = $isSubmitting";
  }
}

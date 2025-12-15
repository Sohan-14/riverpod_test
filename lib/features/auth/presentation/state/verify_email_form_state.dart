class VerifyEmailState {
  final String otp;
  final String? otpError;
  final bool isSubmitting;
  final bool isResending;

  const VerifyEmailState({
    this.otp = '',
    this.otpError,
    this.isSubmitting = false,
    this.isResending = false,
  });

  VerifyEmailState copyWith({
    String? otp,
    String? otpError,
    bool? isSubmitting,
    bool? isResending,
  }) {
    return VerifyEmailState(
      otp: otp ?? this.otp,
      otpError: otpError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isResending: isResending ?? this.isResending,
    );
  }

  bool get isValid => otp.length == 6;
  bool get canSubmit => isValid && !isSubmitting;
}

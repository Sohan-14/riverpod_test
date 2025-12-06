class SignInFormState {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final String? formError;
  final bool isSubmitting;

  SignInFormState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.formError,
    this.isSubmitting = false,
  });

  bool get isValid => emailError == null && passwordError == null && email.isNotEmpty && password.isNotEmpty;

  SignInFormState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    String? formError,
    bool? isSubmitting,
  }) {
    return SignInFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      formError: formError ?? this.formError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  SignInFormState validate() {
    String? emailErr;
    String? passErr;

    if (email.isEmpty) {
      emailErr = 'Email is required';
    } else if (!email.contains('@')) {
      emailErr = 'Enter a valid email';
    }

    if (password.isEmpty) {
      passErr = 'Password is required';
    } else if (password.length < 6) {
      passErr = 'Password must be at least 6 characters';
    }

    return copyWith(
      emailError: emailErr,
      passwordError: passErr,
      formError: null, // Clear form error on re-type
    );
  }
}
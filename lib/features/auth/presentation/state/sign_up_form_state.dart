
class SignUpFormState {
  final String name;
  final String email;
  final String password;
  final String? location;
  final DateTime? dateOfBirth;
  final bool termsAccepted;

  // Validation errors
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? termsError;

  // Track if field was touched (for lazy validation)
  final bool nameTouched;
  final bool emailTouched;
  final bool passwordTouched;
  final bool termsTouched;

  final String? formError;
  final bool isSubmitting;

  SignUpFormState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.location,
    this.dateOfBirth,
    this.termsAccepted = false,
    this.nameError,
    this.emailError,
    this.passwordError,
    this.termsError,
    this.nameTouched = false,
    this.emailTouched = false,
    this.passwordTouched = false,
    this.termsTouched = false,
    this.formError,
    this.isSubmitting = false,
  });

  bool get isValid {
    return nameError == null &&
        emailError == null &&
        passwordError == null &&
        termsError == null &&
        name.trim().isNotEmpty &&
        email.trim().isNotEmpty &&
        password.length >= 6 &&
        termsAccepted;
  }

  SignUpFormState copyWith({
    String? name,
    String? email,
    String? password,
    String? location,
    DateTime? dateOfBirth,
    bool? termsAccepted,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? termsError,
    bool? nameTouched,
    bool? emailTouched,
    bool? passwordTouched,
    bool? termsTouched,
    String? formError,
    bool? isSubmitting,
  }) {
    return SignUpFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      location: location ?? this.location,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      termsAccepted: termsAccepted ?? this.termsAccepted,
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      termsError: termsError ?? this.termsError,
      nameTouched: nameTouched ?? this.nameTouched,
      emailTouched: emailTouched ?? this.emailTouched,
      passwordTouched: passwordTouched ?? this.passwordTouched,
      termsTouched: termsTouched ?? this.termsTouched,
      formError: formError ?? this.formError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  // Validate a specific field when it's touched
  SignUpFormState validateName() {
    String? error;
    if (nameTouched && name.trim().isEmpty) {
      error = 'Name is required';
    }
    return copyWith(nameError: error);
  }

  SignUpFormState validateEmail() {
    String? error;
    if (emailTouched) {
      if (email.isEmpty) {
        error = 'Email is required';
      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
        error = 'Enter a valid email';
      }
    }
    return copyWith(emailError: error);
  }

  SignUpFormState validatePassword() {
    String? error;
    if (passwordTouched) {
      if (password.isEmpty) {
        error = 'Password is required';
      } else if (password.length < 6) {
        error = 'Password must be at least 6 characters';
      }
    }
    return copyWith(passwordError: error);
  }

  SignUpFormState validateTerms() {
    String? error;
    if (termsTouched && !termsAccepted) {
      error = 'You must accept the terms';
    }
    return copyWith(termsError: error);
  }

  // Full validation (used on submit)
  SignUpFormState validateAll() {
    return validateName()
        .validateEmail()
        .validatePassword()
        .validateTerms();
  }
}
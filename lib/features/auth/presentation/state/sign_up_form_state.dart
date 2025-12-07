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
      nameError: nameError,
      emailError: emailError,
      passwordError: passwordError,
      termsError: termsError,
      nameTouched: nameTouched ?? this.nameTouched,
      emailTouched: emailTouched ?? this.emailTouched,
      passwordTouched: passwordTouched ?? this.passwordTouched,
      termsTouched: termsTouched ?? this.termsTouched,
      formError: formError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  String toString() {
    return '''
      SignUpFormState(
        name: $name,
        email: $email,
        password: ${password.isNotEmpty ? "******" : ""},
        location: $location,
        dateOfBirth: $dateOfBirth,
        termsAccepted: $termsAccepted,
        
        nameError: $nameError,
        emailError: $emailError,
        passwordError: $passwordError,
        termsError: $termsError,

        nameTouched: $nameTouched,
        emailTouched: $emailTouched,
        passwordTouched: $passwordTouched,
        termsTouched: $termsTouched,

        formError: $formError,
        isSubmitting: $isSubmitting,
        isValid: $isValid
      )''';
  }
}

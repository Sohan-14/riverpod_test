import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';
import '../states/login_state.dart';

class LoginController extends Notifier<LoginState> {
  @override
  LoginState build() {
    return const LoginState();
  }
  
  void updateEmail(String email) {
    if (email.isEmpty) {
      state = state.copyWith(emailError: 'Email cannot be empty');
    } else if (!email.contains('@')) {
      state = state.copyWith(emailError: 'Please enter a valid email');
    } else {
      state = state.copyWith(emailError: null);
    }
  }

  void updatePassword(String password) {
    if (password.isEmpty) {
      state = state.copyWith(passwordError: 'Password cannot be empty');
    } else if (password.length < 6) {
      state = state.copyWith(passwordError: 'Password must be at least 6 characters');
    } else {
      state = state.copyWith(passwordError: null);
    }
  }

  Future<void> login(String email, String password) async {
    // Validate first
    updateEmail(email);
    updatePassword(password);
    
    // Stop if validation failed
    if (state.emailError != null || state.passwordError != null) {
      return;
    }
    
    state = state.copyWith(isSubmitting: true);
    
    try {
      await ref.read(authProvider.notifier).signIn(
        email: email.trim(), 
        password: password,
      );
      
      state = state.copyWith(
        isSubmitting: false, 
        formSubmitted: true
      );
    } catch (e) {
      state = state.copyWith(isSubmitting: false);
    }
  }
}
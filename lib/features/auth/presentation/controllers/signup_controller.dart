import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../states/sign_up_state.dart';

class SignupController extends Notifier<SignupState> {
  @override
  SignupState build() {
    return const SignupState();
  }
  
  void updateName(String name) {
    if (name.isEmpty) {
      state = state.copyWith(nameError: 'Name cannot be empty');
    } else {
      state = state.copyWith(nameError: null);
    }
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
  
  void updateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      state = state.copyWith(confirmPasswordError: 'Please confirm your password');
    } else if (confirmPassword != password) {
      state = state.copyWith(confirmPasswordError: 'Passwords do not match');
    } else {
      state = state.copyWith(confirmPasswordError: null);
    }
  }

  Future<void> signup(String name, String email, String password, String confirmPassword) async {
    // Validate first
    updateName(name);
    updateEmail(email);
    updatePassword(password);
    updateConfirmPassword(password, confirmPassword);
    
    // Stop if validation failed
    if (state.nameError != null || 
        state.emailError != null || 
        state.passwordError != null ||
        state.confirmPasswordError != null) {
      return;
    }
    
    state = state.copyWith(isSubmitting: true);
    
    try {
      await ref.read(authProvider.notifier).signUp(
        name: name.trim(),
        email: email.trim(),
        password: password,
      );
      
      state = state.copyWith(
        isSubmitting: false, 
        formSubmitted: true,
      );
    } catch (e) {
      state = state.copyWith(isSubmitting: false);
    }
  }
}
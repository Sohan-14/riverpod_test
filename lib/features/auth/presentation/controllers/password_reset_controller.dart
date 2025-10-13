import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../states/password_reset_state.dart';

class PasswordResetController extends Notifier<PasswordResetState> {
  @override
  PasswordResetState build() {
    return const PasswordResetState();
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
  
  void updateCode(String code) {
    if (code.isEmpty) {
      state = state.copyWith(codeError: 'Reset code cannot be empty');
    } else {
      state = state.copyWith(codeError: null);
    }
  }

  Future<void> forgotPassword(String email) async {
    // Validate first
    updateEmail(email);
    
    // Stop if validation failed
    if (state.emailError != null) {
      return;
    }
    
    state = state.copyWith(isSubmittingEmail: true);
    
    try {
      await ref.read(authProvider.notifier).forgotPassword(
        email: email.trim(),
      );
      
      state = state.copyWith(
        isSubmittingEmail: false,
        emailSent: true,
      );
    } catch (e) {
      state = state.copyWith(isSubmittingEmail: false);
    }
  }
  
  Future<void> resetPassword(String code, String password, String confirmPassword) async {
    // Validate first
    updateCode(code);
    updatePassword(password);
    updateConfirmPassword(password, confirmPassword);
    
    // Stop if validation failed
    if (state.codeError != null || 
        state.passwordError != null || 
        state.confirmPasswordError != null) {
      return;
    }
    
    state = state.copyWith(isSubmittingReset: true);
    
    try {
      await ref.read(authProvider.notifier).resetPassword(
        token: code.trim(),
        password: password,
      );
      
      state = state.copyWith(
        isSubmittingReset: false,
        resetComplete: true,
      );
    } catch (e) {
      state = state.copyWith(isSubmittingReset: false);
    }
  }
}
import 'package:app/core/entities/result.dart';
import 'package:app/core/exceptions/failures.dart';
import 'package:app/features/auth/domain/entities/user.dart';
import '../providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../states/auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    checkAuthStatus();
    return const AuthState();
  }

  Future<void> checkAuthStatus() async {
    try {
      final Result<User?, Failure> user = await ref
          .read(authRepositoryProvider)
          .getCurrentUser();
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user.data,
        errorMessage: user.error?.message,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: e.toString(),
        isLoading: false,
      );
    }
  }

  // Sign In
  Future<void> signIn({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final Result<User?, Failure> user = await ref
          .read(authRepositoryProvider)
          .signIn(email: email, password: password);

      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user.data,
        errorMessage: user.error?.message,
        isLoading: false,
      );
    } on AuthException catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: e.message,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: 'An unexpected error occurred',
        isLoading: false,
      );
    }
  }

  // Sign Up
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final Result<User?, Failure> user = await ref
          .read(authRepositoryProvider)
          .signUp(
            email: email,
            password: password,
            name: name,
          );

      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user.data,
        errorMessage: user.error?.message,
        isLoading: false,
      );
    } on AuthException catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: e.message,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: 'An unexpected error occurred',
        isLoading: false,
      );
    }
  }

  // Sign Out
  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);

    try {
      await ref.read(authRepositoryProvider).signOut();
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Failed to sign out',
        isLoading: false,
      );
    }
  }

  // Forgot Password
  Future<void> forgotPassword({required String email}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await ref
          .read(authRepositoryProvider)
          .forgotPassword(
            email: email,
          );
      state = state.copyWith(isLoading: false);
    } on AuthException catch (e) {
      state = state.copyWith(
        errorMessage: e.message,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Failed to send reset email',
        isLoading: false,
      );
    }
  }

  // Reset Password
  Future<void> resetPassword({
    required String token,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await ref.read(authRepositoryProvider).resetPassword(
        token: token, 
        password: password
      );
      state = state.copyWith(isLoading: false);
    } on AuthException catch (e) {
      state = state.copyWith(
        errorMessage: e.message,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Failed to reset password',
        isLoading: false,
      );
    }
  }
}

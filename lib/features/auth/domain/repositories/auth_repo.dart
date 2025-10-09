import '../../../../core/entities/result.dart'; // Ensure this is correctly imported
import '../../../../core/exceptions/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  /// Sign in with email and password
  Future<Result<User, Failure>> signIn({
    required String email,
    required String password,
  });

  /// Sign up with name, email, and password
  Future<Result<User, Failure>> signUp({
    required String name,
    required String email,
    required String password,
  });

  /// Send password reset email
  Future<Result<void, Failure>> forgotPassword({
    required String email,
  });

  /// Reset password with token
  Future<Result<void, Failure>> resetPassword({
    required String token,
    required String password,
  });

  /// Change password (when authenticated)
  Future<Result<void, Failure>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// Sign out the current user
  Future<Result<void, Failure>> signOut();

  /// Get the current authenticated user
  Future<Result<User?, Failure>> getCurrentUser();

  /// Check if user is signed in
  Future<Result<bool, Failure>> isSignedIn();
}

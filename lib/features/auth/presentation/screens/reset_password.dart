import 'package:app/features/auth/presentation/states/auth_state.dart';
import 'package:app/features/auth/presentation/states/password_reset_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/route_paths.dart';
import '../providers/auth_provider.dart';

class ResetPasswordScreen extends ConsumerWidget {
  final String code;

  const ResetPasswordScreen({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
        
    final PasswordResetState resetState = ref.watch(
      passwordResetControllerProvider,
    );
    final AuthState authState = ref.watch(authProvider);

    // If reset is complete, show success screen
    if (resetState.resetComplete) {
      return Scaffold(
        appBar: AppBar(title: const Text('Reset Password')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.check_circle_outline,
                  size: 64,
                  color: Colors.green,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Password Reset Successful',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your password has been successfully reset.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.go(RoutePaths.login),
                  child: const Text('Log In'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Otherwise, show the form
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create a new password for your account.',
            ),
            const SizedBox(height: 24),

            if (authState.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  authState.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),

            // Hidden field to show code error
            if (resetState.codeError != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  resetState.codeError!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),

            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: const OutlineInputBorder(),
                errorText: resetState.passwordError,
              ),
              obscureText: true,
              onChanged: (String value) {
                ref
                    .read(passwordResetControllerProvider.notifier)
                    .updatePassword(value);
                // Also validate confirm password when password changes
                if (confirmPasswordController.text.isNotEmpty) {
                  ref
                      .read(passwordResetControllerProvider.notifier)
                      .updateConfirmPassword(
                        value,
                        confirmPasswordController.text,
                      );
                }
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                border: const OutlineInputBorder(),
                errorText: resetState.confirmPasswordError,
              ),
              obscureText: true,
              onChanged: (String value) => ref
                  .read(passwordResetControllerProvider.notifier)
                  .updateConfirmPassword(passwordController.text, value),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: resetState.isSubmittingReset
                  ? null
                  : () => ref
                        .read(passwordResetControllerProvider.notifier)
                        .resetPassword(
                          code,
                          passwordController.text,
                          confirmPasswordController.text,
                        ),
              child: resetState.isSubmittingReset
                  ? const CircularProgressIndicator()
                  : const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}

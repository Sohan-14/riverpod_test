import 'package:app/features/auth/presentation/states/auth_state.dart';
import 'package:app/features/auth/presentation/states/password_reset_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/route_paths.dart';
import '../providers/auth_provider.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final PasswordResetState resetState = ref.watch(
      passwordResetControllerProvider,
    );
    final AuthState authState = ref.watch(authProvider);

    // If email has been sent, show success screen
    if (resetState.emailSent) {
      return Scaffold(
        appBar: AppBar(title: const Text('Forgot Password')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.email_outlined,
                  size: 64,
                  color: Colors.blue,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Reset Email Sent',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'We\'ve sent a password reset link to ${emailController.text}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Return to Login'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Otherwise, show the form
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Forgot your password?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your email address and we\'ll send you a link to reset your password.',
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

            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                errorText: resetState.emailError,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) => ref
                  .read(passwordResetControllerProvider.notifier)
                  .updateEmail(value),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: resetState.isSubmittingEmail
                  ? null
                  : () => ref
                        .read(passwordResetControllerProvider.notifier)
                        .forgotPassword(
                          emailController.text,
                        ),
              child: resetState.isSubmittingEmail
                  ? const CircularProgressIndicator()
                  : const Text('Send Reset Link'),
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () => context.go(RoutePaths.login),
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}

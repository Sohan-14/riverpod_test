import 'package:app/features/auth/presentation/states/auth_state.dart';
import 'package:app/features/auth/presentation/states/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/route_paths.dart';
import '../providers/auth_provider.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    final SignupState signupState = ref.watch(signupControllerProvider);
    final AuthState authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (authState.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    authState.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: const OutlineInputBorder(),
                  errorText: signupState.nameError,
                ),
                onChanged: (String value) => ref
                    .read(signupControllerProvider.notifier)
                    .updateName(value),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: const OutlineInputBorder(),
                  errorText: signupState.emailError,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) => ref
                    .read(signupControllerProvider.notifier)
                    .updateEmail(value),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  errorText: signupState.passwordError,
                ),
                obscureText: true,
                onChanged: (String value) {
                  ref
                      .read(signupControllerProvider.notifier)
                      .updatePassword(value);
                  // Also validate confirm password when password changes
                  if (confirmPasswordController.text.isNotEmpty) {
                    ref
                        .read(signupControllerProvider.notifier)
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
                  labelText: 'Confirm Password',
                  border: const OutlineInputBorder(),
                  errorText: signupState.confirmPasswordError,
                ),
                obscureText: true,
                onChanged: (String value) => ref
                    .read(signupControllerProvider.notifier)
                    .updateConfirmPassword(passwordController.text, value),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: signupState.isSubmitting
                    ? null
                    : () => ref
                          .read(signupControllerProvider.notifier)
                          .signup(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            confirmPasswordController.text,
                          ),
                child: signupState.isSubmitting
                    ? const CircularProgressIndicator()
                    : const Text('Sign Up'),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => context.push(RoutePaths.login),
                    child: const Text('Log In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

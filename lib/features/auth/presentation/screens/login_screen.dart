import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/image_loader.dart';
import '../states/login_state.dart';
import '../states/auth_state.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_title_section.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final LoginState loginState = ref.watch(loginControllerProvider);
    final AuthState authState = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const ImageLoader(
                imagePath: AppIcons.login,
              ),

              const SizedBox(
                height: AppSizes.md,
              ),

              const AuthTitleSection(
                title: "Sign in to continue",
                subTitle: "Enter valid user name & password to continue ",
              ),

              const SizedBox(
                height: AppSizes.md,
              ),

              if (authState.errorMessage == null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    authState.errorMessage.toString(),
                    textAlign: TextAlign.center,
                    style: context.txtTheme.bodyLarge?.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: const OutlineInputBorder(),
                  errorText: loginState.emailError,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) => ref
                    .read(loginControllerProvider.notifier)
                    .updateEmail(value),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  errorText: loginState.passwordError,
                ),
                obscureText: true,
                onChanged: (String value) => ref
                    .read(loginControllerProvider.notifier)
                    .updatePassword(value),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: loginState.isSubmitting
                    ? null
                    : () => ref
                          .read(loginControllerProvider.notifier)
                          .login(
                            emailController.text,
                            passwordController.text,
                          ),
                child: loginState.isSubmitting
                    ? const CircularProgressIndicator()
                    : const Text('Log In'),
              ),

              TextButton(
                onPressed: () => context.push(RoutePaths.forgotPassword),
                child: const Text('Forgot Password?'),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () => context.push(RoutePaths.signUp),
                    child: const Text('Sign Up'),
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

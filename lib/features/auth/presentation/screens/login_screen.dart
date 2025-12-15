// lib/features/auth/presentation/screens/login_screen.dart
import 'package:app/features/auth/presentation/state/sign_in_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../providers/auth_providers.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_title_section.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignInFormState state = ref.watch(signInProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.spaceBetweenItems,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenSections),

              const ImageLoader(
                imagePath: AppIcons.login,
                width: 160,
                height: 160,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              const AuthTitleSection(
                title: "Sign in to continue",
                subTitle: "Enter valid email & password to continue",
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AuthTextField(
                onChanged: (String value) =>
                    ref.read(signInProvider.notifier).setEmail = value,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                errorText: state.emailError,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                onChanged: (String value) =>
                    ref.read(signInProvider.notifier).setPassword = value,
                labelText: 'Password',
                obscureText: true,
                prefixIcon: Icons.lock_outline_sharp,
                errorText: state.passwordError,
              ),

              if (state.formError != null) ...<Widget>[
                const SizedBox(height: AppSizes.spaceBetweenItems),
                Text(
                  state.formError!,
                  style: context.txtTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () => context.push(RoutePaths.forgotPassword),
                    child: Text(
                      'Forgot Password?',
                      style: context.txtTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              AppElevatedButton(
                onPressed: state.isValid && !state.isSubmitting
                    ? () => ref.read(signInProvider.notifier).login()
                    : null,
                isLoading: state.isSubmitting,
                label: 'Log In',
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),
              Text(
                "OR",
                textAlign: TextAlign.center,
                style: context.txtTheme.bodySmall,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AppOutlineButton(
                onPressed: () =>
                    ref.read(signInProvider.notifier).signInWithGoogle(),
                label: 'Google',
                icon: const ImageLoader(
                  imagePath: AppIcons.google,
                  width: AppSizes.iconSm,
                  height: AppSizes.iconSm,
                ),
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: context.txtTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => context.push(RoutePaths.signUp),
                    child: Text(
                      'Sign Up',
                      style: context.txtTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

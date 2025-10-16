import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_title_section.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                subTitle: "Enter valid user name & password to continue",
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AuthTextField(
                    controller: emailController,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,
                  );
                },
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AuthTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    obscureText: true,
                    prefixIcon: Icons.lock_outline_sharp,
                  );
                },
              ),

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
                onPressed: () {
                  context.go(RoutePaths.bottomNav);
                  // ref
                  //     .read(loginControllerProvider.notifier)
                  //     .login(
                  //       emailController.text,
                  //       passwordController.text,
                  //     );
                },
                label: 'Log In',
                isLoading: ref.watch(loginControllerProvider).isSubmitting,
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
              Text(
                "OR",
                textAlign: TextAlign.center,
                style: context.txtTheme.bodySmall,
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),

              AppOutlineButton(
                onPressed: () {
                  ref
                      .read(loginControllerProvider.notifier)
                      .login(
                        emailController.text,
                        passwordController.text,
                      );
                },
                label: 'Google',
                icon: const ImageLoader(
                  imagePath: AppIcons.google,
                  width: AppSizes.iconSm,
                  height: AppSizes.iconSm,
                ),
                isLoading: ref.watch(loginControllerProvider).isSubmitting,
              ),

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

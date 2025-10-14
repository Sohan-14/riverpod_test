import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/shared/app_elevated_button.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/image_loader.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_title_section.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
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
                imagePath: AppIcons.signUp,
                width: 160,
                height: 160,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              const AuthTitleSection(
                title: "Create Your Account",
                subTitle: "Please provide your details to sign up",
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AuthTextField(
                    controller: userController,
                    labelText: 'User Name',
                    keyboardType: TextInputType.text,
                    prefixIcon: CupertinoIcons.profile_circled,
                  );
                },
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AuthTextField(
                    controller: emailController,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                  );
                },
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AuthTextField(
                    controller: locationController,
                    labelText: 'Location',
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.location_on_outlined,
                  );
                },
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AuthTextField(
                    controller: locationController,
                    labelText: 'Date of birth',
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.calendar_today,
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
                    prefixIcon: Icons.lock,
                  );
                },
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Row(
                children: <Widget>[
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "By creating an account, I accept the ",
                        style: context.txtTheme.bodyMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Terms & Conditions",
                            style: context.txtTheme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: " & ",
                          ),
                          TextSpan(
                            text: "Privacy Policy.",
                            style: context.txtTheme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              AppElevatedButton(
                onPressed: () {
                  ref
                      .read(loginControllerProvider.notifier)
                      .login(
                        emailController.text,
                        passwordController.text,
                      );
                },
                label: 'Continue',
                isLoading: ref.watch(loginControllerProvider).isSubmitting,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: context.txtTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => context.push(RoutePaths.login),
                    child: Text(
                      'Sign In',
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shared/app_elevated_button.dart';
import '../../../../core/config/sizes.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_title_section.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();

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

              const AuthTitleSection(
                title: "Forgot Password",
                subTitle: "Enter your email to reset your password",
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
              const SizedBox(height: AppSizes.spaceBetweenSections),
              AppElevatedButton(
                onPressed: () {},
                label: 'Send Code',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

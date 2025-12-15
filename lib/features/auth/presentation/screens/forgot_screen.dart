import 'package:app/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../providers/auth_providers.dart';
import '../state/forgot_password_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_title_section.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ForgotPasswordState state = ref.watch(forgotPasswordProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        showBackBtn: true,
      ),
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

              AuthTextField(
                onChanged: (String value) =>
                    ref.read(forgotPasswordProvider.notifier).setEmail = value,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                errorText: state.emailError,
              ),

              if (state.formError != null) ...<Widget>[
                const SizedBox(height: AppSizes.spaceBetweenItems),
                Text(
                  state.formError!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AppElevatedButton(
                onPressed: state.isValid && !state.isSubmitting
                    ? () => ref
                          .read(forgotPasswordProvider.notifier)
                          .sendResetCode()
                    : null,
                isLoading: state.isSubmitting,
                label: 'Send Code',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

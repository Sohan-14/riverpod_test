import 'package:app/features/auth/presentation/providers/auth_providers.dart';
import 'package:app/features/auth/presentation/state/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_title_section.dart';

class ResetPasswordScreen extends ConsumerWidget {
  final String email;

  const ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ResetPasswordState state = ref.watch(resetPasswordProvider);

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
                title: "Reset Password",
                subTitle: "Set your new password",
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AuthTextField(
                onChanged: (String value) =>
                    ref.read(resetPasswordProvider.notifier).setNewPassword =
                        value,
                labelText: 'New Password',
                obscureText: true,
                prefixIcon: Icons.lock_outline_rounded,
                errorText: state.newPasswordError,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                onChanged: (String value) =>
                    ref
                            .read(resetPasswordProvider.notifier)
                            .setConfirmPassword =
                        value,
                labelText: 'Confirm Password',
                obscureText: true,
                prefixIcon: Icons.lock_outline_rounded,
                errorText: state.confirmPasswordError,
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AppElevatedButton(
                onPressed: state.isValid && !state.isSubmitting
                    ? () => ref
                          .read(resetPasswordProvider.notifier)
                          .resetPassword(email)
                    : null,
                isLoading: state.isSubmitting,
                label: 'Reset Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// lib/features/auth/presentation/screens/verify_email_screen.dart
import 'package:app/features/auth/presentation/state/verify_email_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_title_section.dart';
import '../providers/auth_providers.dart'; // to access verifyEmailProvider

class VerifyEmailScreen extends ConsumerWidget {
  final String type;
  final String email;

  const VerifyEmailScreen({
    super.key,
    required this.type,
    required this.email,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VerifyEmailState state = ref.watch(verifyEmailProvider);

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
                title: "Verify Email",
                subTitle:
                    "To continue, enter the 6-digit code we sent to your email.",
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AuthTextField(
                onChanged: (String value) =>
                    ref.read(verifyEmailProvider.notifier).setOtp = value,
                labelText: 'Enter OTP',
                keyboardType: TextInputType.number,
                prefixIcon: Icons.pin_outlined,
                errorText: state.otpError,
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AppElevatedButton(
                onPressed: state.isValid && !state.isSubmitting
                    ? () => ref
                          .read(verifyEmailProvider.notifier)
                          .verifyOtp(type: type, email: email)
                    : null,
                isLoading: state.isSubmitting,
                label: 'Verify Email',
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Didn’t receive code?",
                    style: context.txtTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: state.isResending
                        ? null
                        : () => ref
                              .read(verifyEmailProvider.notifier)
                              .resendCode(email),
                    child: Text(
                      'Resend Code',
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

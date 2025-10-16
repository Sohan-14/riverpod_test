import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/utils/toast/toast.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_title_section.dart';

class VerifyEmailScreen extends ConsumerWidget {
  final String type;
  const VerifyEmailScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController otpController = TextEditingController();

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

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AuthTextField(
                    controller: otpController,
                    labelText: 'Enter OTP',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.pin_outlined,
                  );
                },
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections),
              AppElevatedButton(
                onPressed: () {
                  Toast.showSuccess("Email is verified");
                  if (type == "forgot") {
                    context.go(
                      RoutePaths.resetPassword,
                    );
                  }
                  else{
                    context.go(RoutePaths.bottomNav);
                  }
                },
                label: 'Verify Email',
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Didn’t  received  code?",
                    style: context.txtTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Toast.showSuccess("Code Resend Successfully");
                    },
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

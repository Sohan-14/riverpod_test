import 'package:app/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/utils/toast/toast.dart';
import '../widgets/auth_text_field.dart';

class ChangePasswordScreen extends ConsumerWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Change Password",
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
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AuthTextField(
                    controller: oldPasswordController,
                    labelText: 'Old Password',
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.lock_outline_rounded,
                  );
                },
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AuthTextField(
                    controller: newPasswordController,
                    labelText: 'New Password',
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.lock_outline_rounded,
                  );
                },
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return AuthTextField(
                    controller: confirmPasswordController,
                    labelText: 'Confirm Password',
                    obscureText: true,
                    prefixIcon: Icons.lock_outline_rounded,
                  );
                },
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AppElevatedButton(
                onPressed: () {
                  Toast.showSuccess("Password reset successfully");
                  context.pop();
                  // ref
                  //     .read(loginControllerProvider.notifier)
                  //     .login(
                  //       ol.text,
                  //       passwordController.text,
                  //     );
                },
                label: 'Change Password',
                // isLoading: ref.watch(loginControllerProvider).isSubmitting,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

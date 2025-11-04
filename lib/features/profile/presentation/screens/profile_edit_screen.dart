import 'package:app/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/app_text_field.dart';

class ProfileEditScreen extends ConsumerWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Edit Profile",
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
              AppTextField(
                controller: TextEditingController(),
                labelText: 'Name',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              AppTextField(
                controller: TextEditingController(),
                labelText: 'Phone',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              AppTextField(
                controller: TextEditingController(),
                labelText: 'Address',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              AppTextField(
                controller: TextEditingController(),
                labelText: 'Bio',
                minLines: 5,
                maxLines: 7,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AppElevatedButton(
                onPressed: () {},
                label: 'Update Profile',
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

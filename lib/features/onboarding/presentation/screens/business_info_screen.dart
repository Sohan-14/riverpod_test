// lib/features/onboarding/presentation/screens/business_info_screen.dart

import 'dart:io';
import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:app/features/onboarding/presentation/controllers/business_info_controller.dart';
import 'package:app/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:app/features/onboarding/presentation/state/business_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../../../core/utils/dotted_border.dart';
import '../../../../core/utils/image_picker_utils.dart';
import '../widgets/onboarding_text_field.dart';

class BusinessInfoScreen extends ConsumerWidget {
  const BusinessInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BusinessInfoState state = ref.watch(businessInfoProvider);
    final BusinessInfoNotifier notifier = ref.read(
      businessInfoProvider.notifier,
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: "Business Profile",
        showBackBtn: false,
        titleAlignment: TitleAlignment.left,
        alignmentValue: 0,
        elevation: 4.0,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await SecureStorageService().clear();
              context.go(RoutePaths.role);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.md,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Update your seller profile. Make it easy for customers to find and know your business.",
                textAlign: TextAlign.start,
                style: context.txtTheme.bodyMedium?.copyWith(
                  wordSpacing: 2.0,
                  height: 2.0,
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              // Business Name
              OnboardingTextField(
                onChanged: notifier.setBusinessName,
                labelText: "Business Name",
                errorText: state.businessNameError,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              // Location
              OnboardingTextField(
                onChanged: notifier.setLocation,
                labelText: "Business Location",
                errorText: state.locationError,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              // Description
              OnboardingTextField(
                onChanged: notifier.setDescription,
                labelText: "Business Description",
                minLine: 5,
                maxLine: 7,
                errorText: state.descriptionError,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              // Image Picker
              GestureDetector(
                onTap: () async {
                  final File? file = await ImagePickerUtils.pickImageFile();
                  notifier.setProfileImage(file);
                },
                child: state.profileImage != null
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: context.screenWidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: ImageLoader(
                            imagePath: state.profileImage,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                      )
                    : CustomPaint(
                        painter: DottedBorderPainter(),
                        child: Container(
                          width: context.screenWidth,
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.xxxL,
                            horizontal: AppSizes.md,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.grey.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                Icons.add_photo_alternate_outlined,
                                size: AppSizes.iconLg,
                                color: AppColors.grey,
                              ),
                              const SizedBox(height: AppSizes.sm),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ImageLoader(
                                    imagePath: AppIcons.cloud,
                                    width: 24,
                                    height: 24,
                                    color: AppColors.grey,
                                  ),
                                  const SizedBox(width: AppSizes.sm),
                                  Text(
                                    "Add Your File",
                                    style: context.txtTheme.bodyMedium
                                        ?.copyWith(
                                          color: AppColors.grey,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AppElevatedButton(
                onPressed: state.isValid && !state.isSubmitting
                    ? () => notifier.submitBusinessInfo()
                    : null,
                isLoading: state.isSubmitting,
                label: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

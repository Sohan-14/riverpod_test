import 'dart:io';

import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../widgets/onboarding_text_field.dart';
import '../widgets/onboarding_title_section.dart';

class BusinessInfoScreen extends StatefulWidget {
  const BusinessInfoScreen({super.key});

  @override
  State<BusinessInfoScreen> createState() => _BusinessInfoScreenState();
}

class _BusinessInfoScreenState extends State<BusinessInfoScreen> {
  final TextEditingController businessNameCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();
  File? profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.md,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems),

              const OnboardingTitleSection(
                title: "Business Profile",
                subTitle: "Set your business profile",
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              OnboardingTextField(
                controller: businessNameCtrl,
                labelText: "Business Name",
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              OnboardingTextField(
                controller: descriptionCtrl,
                labelText: "Business Description",
                minLine: 5,
                maxLine: 7,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.xxxL,
                    horizontal: AppSizes.md,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey.withValues(alpha: .4),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: AppSizes.sm,
                    children: <Widget>[
                      const Icon(
                        Icons.add_photo_alternate_outlined,
                        size: AppSizes.iconLg,
                        color: AppColors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: AppSizes.sm,
                        children: <Widget>[
                          const ImageLoader(
                            imagePath: AppIcons.cloud,
                            width: 24.0,
                            height: 24.0,
                            color: AppColors.grey,
                          ),
                          Text(
                            "Add Your File",
                            style: context.txtTheme.bodyMedium?.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

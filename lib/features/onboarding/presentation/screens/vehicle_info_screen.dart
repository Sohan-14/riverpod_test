import 'dart:io';

import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:app/core/utils/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/custom_dropdown.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../../core/utils/image_picker_utils.dart';
import '../widgets/onboarding_title_section.dart';

class VehicleInfoScreen extends StatefulWidget {
  const VehicleInfoScreen({super.key});

  @override
  State<VehicleInfoScreen> createState() => _VehicleInfoScreenState();
}

class _VehicleInfoScreenState extends State<VehicleInfoScreen> {
  final TextEditingController businessNameCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();
  File? frontPart;
  File? backPart;

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
                title: "Verify License",
                subTitle:
                    "Verify your driving license easily. Your documents are 100% secure and kept safe with us.",
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              CustomDropdown<String>(
                hint: "Vehicle Type",
                options: const <String>[
                  "Car",
                  "Van",
                  "Motorbike / Scooter",
                  "Bicycle",
                  "Pickup Truck",
                  "Mini Truck",
                  "Truck / Lorry",
                  "Bus / Minibus",
                  "Trailer",
                ],
                displayString: (String type) {
                  return type;
                },
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              GestureDetector(
                onTap: () async {
                  final File? file = await ImagePickerUtils.pickImageFile();
                  setState(() {
                    frontPart = file;
                  });
                },
                child: frontPart != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ImageLoader(
                          imagePath: frontPart,
                          width: double.infinity,
                          height: 200,
                        ),
                      )
                    : CustomPaint(
                        painter: DottedBorderPainter(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.xxxL,
                            horizontal: AppSizes.md,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.grey.withValues(alpha: .4),
                            // borderRadius: BorderRadius.circular(12.0),
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
                                    "Add Your driving license front part",
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

              const SizedBox(height: AppSizes.spaceBetweenItems),

              GestureDetector(
                onTap: () async {
                  final File? file = await ImagePickerUtils.pickImageFile();
                  setState(() {
                    backPart = file;
                  });
                },
                child: backPart != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ImageLoader(
                          imagePath: backPart,
                          width: double.infinity,
                          height: 200,
                        ),
                      )
                    : CustomPaint(
                        painter: DottedBorderPainter(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.xxxL,
                            horizontal: AppSizes.md,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.grey.withValues(alpha: .4),
                            // borderRadius: BorderRadius.circular(12.0),
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
                                    "Add Your driving license back part",
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

              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),

              AppElevatedButton(
                onPressed: () {
                  context.go(
                    RoutePaths.interest,
                  );
                },
                label: "Verify",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

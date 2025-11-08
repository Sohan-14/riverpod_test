import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/app_text_field.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/custom_dropdown.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../../core/utils/dotted_border.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Product',
        showBackBtn: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomPaint(
                painter: DottedBorderPainter(),
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

              const SizedBox(height: AppSizes.lg),

              AppTextField(
                controller: TextEditingController(),
                labelText: 'Product Title',
              ),

              const SizedBox(height: AppSizes.lg),

              CustomDropdown<String>(
                options: const <String>[
                  "Electronics & Gadgets",
                  "Fashion & Appare",
                  "Health & Beauty",
                  "Home & Living",
                ],
                displayString: (String value) {
                  return value;
                },
              ),

              const SizedBox(height: AppSizes.lg),

              AppTextField(
                controller: TextEditingController(),
                labelText: 'Price',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: AppSizes.lg),

              AppTextField(
                controller: TextEditingController(),
                labelText: 'Quantity',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: AppSizes.lg),

              AppTextField(
                controller: TextEditingController(),
                labelText: 'Description',
                minLines: 5,
                maxLines: 7,
              ),

              const SizedBox(height: AppSizes.lg),

              AppElevatedButton(
                label: "Upload",
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/app_text_field.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../../core/utils/dotted_border.dart';

class CreateAdsScreen extends StatelessWidget {
  const CreateAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Create Ads",
        showBackBtn: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.md,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Upload image/video",
              style: context.txtTheme.bodyLarge,
            ),
            const SizedBox(
              height: AppSizes.sm,
            ),
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

            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),

            AppTextField(
              labelText: "Ads Title",
              controller: TextEditingController(),
            ),

            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),

            AppTextField(
              labelText: "Ads Desc",
              controller: TextEditingController(),
            ),

            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),

            AppElevatedButton(
              onPressed: () {
                context.pop();
              },
              label: "Publish",
            ),
          ],
        ),
      ),
    );
  }
}

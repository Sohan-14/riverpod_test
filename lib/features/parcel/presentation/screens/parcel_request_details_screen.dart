import 'package:app/core/config/icons.dart';
import 'package:app/core/config/sizes.dart';
import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/extensions/widget_extensions.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:app/core/shared/widgets/custom_app_bar.dart';
import 'package:app/core/shared/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';
import '../../../../core/utils/toast/toast.dart';

class ParcelRequestDetailsScreen extends StatelessWidget {
  const ParcelRequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Parcel Request Details',
        showBackBtn: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.md,
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: const Border(
              top: BorderSide(
                color: AppColors.primary,
                width: 5.0,
              ),
              right: BorderSide(
                color: AppColors.primary,
                width: 1.0,
              ),
              left: BorderSide(
                color: AppColors.primary,
                width: 1.0,
              ),
              bottom: BorderSide(
                color: AppColors.primary,
                width: 5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(AppSizes.xs),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary,
                    width: .5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "John",
                      style: context.txtTheme.bodyMedium,
                    ),
                    Text(
                      "Seller",
                      style: context.txtTheme.bodyMedium?.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),

              Text(
                'Destination',
                style: context.txtTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              Row(
                spacing: AppSizes.md,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      spacing: AppSizes.sm,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Pick-Up',
                          style: context.txtTheme.bodyMedium,
                        ),
                        Text(
                          '120 Main Street,10 number apartment, dhaka,1206, Dhaka',
                          style: context.txtTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ).expanded,

                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      spacing: AppSizes.sm,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Drop-Off',
                          style: context.txtTheme.bodyMedium,
                        ),
                        Text(
                          '120 Main Street,10 number apartment, dhaka,1206, Dhaka',
                          style: context.txtTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ).expanded,
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),
              Text(
                'Receiver Information',
                style: context.txtTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              Row(
                spacing: AppSizes.md,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppSizes.sm,
                      children: <Widget>[
                        Text(
                          'Name',
                          style: context.txtTheme.bodyMedium,
                        ),
                        Text(
                          'John Doe',
                          style: context.txtTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ).expanded,

                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppSizes.sm,
                      children: <Widget>[
                        Text(
                          'Phone Number',
                          style: context.txtTheme.bodyMedium,
                        ),
                        Text(
                          '876-543-2109',
                          style: context.txtTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ).expanded,
                ],
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),
              Text(
                'Receiver Information',
                style: context.txtTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              Row(
                spacing: AppSizes.md,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppSizes.sm,
                      children: <Widget>[
                        Text(
                          'Parcel Type',
                          style: context.txtTheme.bodyMedium,
                        ),
                        Text(
                          'Documents',
                          style: context.txtTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ).expanded,

                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppSizes.sm,
                      children: <Widget>[
                        Text(
                          'Parcel Quantity',
                          style: context.txtTheme.bodyMedium,
                        ),
                        Text(
                          '1',
                          style: context.txtTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ).expanded,
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSizes.sm,
                  children: <Widget>[
                    Text(
                      'Bottle Shape: Sleek, elegant glass bottle with soft curves. Color Theme: Clear crystal bottle with a golden cap and maybe a touch of blush pink or matte black for a luxury vibe.',
                      style: context.txtTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: .5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Chat with seller",
                      style: context.txtTheme.bodyMedium,
                    ),
                    AppElevatedButton(
                      width: 100,
                      height: 30,
                      label: "Chat",
                      onPressed: () => context.push(RoutePaths.oneToOneChat),
                      icon: const ImageLoader(
                        imagePath: AppIcons.chatBottomNav,
                        color: AppColors.white,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),

              Row(
                spacing: AppSizes.md,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AppOutlineButton(
                    height: 30,
                    label: "Cancel",
                    onPressed: () {
                      Toast.showSuccess("Cancel");
                    },
                    outlineColor: Colors.red,
                  ).expanded,
                  AppElevatedButton(
                    height: 30,
                    label: "Confirm",
                    onPressed: () {
                      Toast.showSuccess("Confirm");
                    },
                  ).expanded,
                ],
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

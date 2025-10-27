import 'package:app/core/config/sizes.dart';
import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/extensions/widget_extensions.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:app/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class AssignedDriverScreen extends StatelessWidget {
  const AssignedDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Assigned Driver',
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
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSizes.sm,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: GestureDetector(
                        onTap: () => context.push(
                          RoutePaths.imageFullScreen,
                          extra: <String, String>{
                            "imagePath":
                                "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
                          },
                        ),
                        child: const ImageLoader(
                          imagePath:
                              "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
                          width: 80,
                          height: 60,
                        ),
                      ),
                    ),
                    Column(
                      spacing: AppSizes.xs,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Luréa",
                          style: context.txtTheme.bodyLarge,
                        ),
                        Text(
                          "Price: \$25",
                          style: context.txtTheme.bodySmall,
                        ),
                        const SizedBox(
                          height: AppSizes.sm,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSizes.md,
              ),

              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSizes.sm,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: GestureDetector(
                        onTap: () => context.push(
                          RoutePaths.imageFullScreen,
                          extra: <String, String>{
                            "imagePath":
                                "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          },
                        ),
                        child: const ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    Column(
                      spacing: AppSizes.xs,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "John Doe",
                          style: context.txtTheme.bodyLarge,
                        ),
                        Text(
                          "1234 Elm Street, Springfield, IL 62704",
                          style: context.txtTheme.bodyMedium,
                        ),
                        Row(
                          spacing: AppSizes.sm,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "876-543-2109",
                              style: context.txtTheme.bodyMedium,
                            ),
                            AppElevatedButton(
                              label: "Chat",
                              width: 80,
                              height: 30,
                              icon: const Icon(
                                Icons.chat_bubble,
                                color: Colors.white,
                                size: 16,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSizes.sm,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),
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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Store Details",
        showBackBtn: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.md,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    spacing: AppSizes.xs,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "ShopNow Store",
                        style: context.txtTheme.bodyLarge,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(
                        Icons.star_rounded,
                        color: AppColors.secondary,
                      ),
                      Text(
                        "(4.8)",
                        style: context.txtTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: AppSizes.md,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: AppSizes.sm,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        onTap: () => context.push(
                          RoutePaths.imageFullScreen,
                          extra: <String, String>{
                            "imagePath":
                                "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2xvdGhpbmclMjBzdG9yZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          },
                        ),
                        child: const ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2xvdGhpbmclMjBzdG9yZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSizes.sm,
                    ),

                    Text(
                      "Curating timeless fragrances that define your style & story. Authentic, luxury, and niche perfumes — delivered with love.",
                      style: context.txtTheme.bodyMedium?.copyWith(
                        height: 2.0,
                        wordSpacing: 2.0,
                      ),
                    ),

                    const SizedBox(
                      height: AppSizes.sm,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          spacing: AppSizes.xs,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Gulsan Dhaka",
                              style: context.txtTheme.bodyLarge,
                            ),
                          ],
                        ),

                        AppElevatedButton(
                          width: 100,
                          height: 40,
                          onPressed: () {},
                          label: "Chat",
                          icon: const ImageLoader(
                            imagePath: AppIcons.chatBottomNav,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: AppSizes.md,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSizes.md,
              ),

              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List<ClipRRect>.generate(
                  10,
                  (int index) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
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
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

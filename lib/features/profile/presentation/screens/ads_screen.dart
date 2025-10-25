import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Ads",
        showBackBtn: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.md,
        ),
        child: Column(
          children: <Widget>[
            Row(
              spacing: AppSizes.spaceBetweenItems,
              children: <Widget>[
                Expanded(
                  child: AppElevatedButton(
                    icon: const ImageLoader(
                      imagePath: AppIcons.advertise,
                      width: 24.0,
                      height: 24.0,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      context.push(RoutePaths.createAds);
                    },
                    label: "Create Ads",
                  ),
                ),
                Expanded(
                  child: AppElevatedButton(
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      context.push(RoutePaths.boostAds);
                    },
                    label: "Boost Ads",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

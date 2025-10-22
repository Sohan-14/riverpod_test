import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Orders",
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
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const OrderContainer();
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: AppSizes.md,
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

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.sm,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
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
                width: 140,
                height: 120,
              ),
            ),
          ),
          Column(
            spacing: AppSizes.xs,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Luréa",
                style: context.txtTheme.bodyLarge,
              ),
              Text(
                "Perfume",
                style: context.txtTheme.bodySmall,
              ),
              Text(
                "\$25",
                style: context.txtTheme.bodySmall,
              ),
              Text(
                "Quantity: 01",
                style: context.txtTheme.bodySmall,
              ),

              Row(
                spacing: AppSizes.sm,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.silver,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      "Pending",
                      style: context.txtTheme.bodySmall,
                    ),
                  ),

                  GestureDetector(
                    onTap: () => context.push(RoutePaths.productDetails),
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class OrderConfirmScreen extends StatelessWidget {
  const OrderConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Confirm Order",
        showBackBtn: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.spaceBetweenItems,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems),

              Text(
                "Shipping Address",
                style: context.txtTheme.bodyLarge?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: AppSizes.sm),

              Text("Zahidul Islam Shohan", style: context.txtTheme.bodyLarge),
              const SizedBox(height: AppSizes.xs),
              Text("01841093843", style: context.txtTheme.bodyMedium),
              const SizedBox(height: AppSizes.xs),
              Text(
                "123 Main Street,2number apartment, dhaka,1206, Dhaka",
                style: context.txtTheme.bodyMedium,
              ),
              const SizedBox(height: AppSizes.xs),
              Text("Quantity: 01", style: context.txtTheme.bodyMedium),

              const SizedBox(height: AppSizes.spaceBetweenItems),
              Text(
                "Products Details",
                style: context.txtTheme.bodyLarge?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: AppSizes.sm),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                        width: 80,
                        height: 60,
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
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),
              Text(
                "Payment Method",
                style: context.txtTheme.bodyLarge?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: AppSizes.sm),

              Row(
                children: <Widget>[
                  const Radio<bool>(
                    value: true,
                    // ignore: deprecated_member_use
                    groupValue: true,
                  ),
                  Text("Cash On Delivery", style: context.txtTheme.bodyLarge),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),
              AppElevatedButton(
                onPressed: () {
                  context.go(RoutePaths.bottomNav);
                },
                label: 'Order Confirm',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

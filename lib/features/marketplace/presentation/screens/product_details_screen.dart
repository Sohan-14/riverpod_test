import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/extensions/widget_extensions.dart';
import 'package:app/core/shared/widgets/app_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/provider/role_provider.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Product Details",
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
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: AppSizes.sm,
                children: <Widget>[
                  ClipOval(
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
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Column(
                    spacing: AppSizes.xs,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "ShopNow Store",
                        style: context.txtTheme.bodyLarge,
                      ),
                      Text(
                        "Gulsan Dhaka",
                        style: context.txtTheme.bodySmall,
                      ),
                    ],
                  ),

                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: <Widget>[
                  //     const Icon(
                  //       Icons.star_rounded,
                  //       color: AppColors.secondary,
                  //     ),
                  //     Text(
                  //       "(4.8)",
                  //       style: context.txtTheme.bodySmall,
                  //     ),
                  //   ],
                  // ),
                ],
              ),

              const SizedBox(
                height: AppSizes.md,
              ),
              Column(
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
                              "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
                        },
                      ),
                      child: const ImageLoader(
                        imagePath:
                            "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
                        width: double.infinity,
                        height: 250,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: AppSizes.sm,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Gulsan Dhaka",
                        style: context.txtTheme.bodyLarge,
                      ),

                      Text(
                        "\$25",
                        style: context.txtTheme.bodyLarge,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: AppSizes.md,
                  ),

                  Text(
                    "Product Details",
                    style: context.txtTheme.bodyLarge?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  Text("Perfume", style: context.txtTheme.bodyLarge),

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

                  Text(
                    "Size: 50ml and 100ml bottles.",
                    style: context.txtTheme.bodyMedium?.copyWith(
                      height: 2.0,
                      wordSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizes.md,
              ),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  // ✅ Watch the async provider
                  final AsyncValue<Role> roleAsync = ref.watch(
                    selectedRoleProvider,
                  );

                  final Role? role = roleAsync.value;

                  if (role == null) {
                    return const SizedBox.shrink();
                  }

                  // Now safely use `role`
                  if (role != Role.seller) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          spacing: AppSizes.md,
                          children: <Widget>[
                            Text(
                              "Quantity : ",
                              style: context.txtTheme.bodyLarge,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.silver,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                "-",
                                style: context.txtTheme.bodyLarge,
                              ),
                            ),
                            Text(
                              "1",
                              style: context.txtTheme.bodyLarge,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.silver,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                "+",
                                style: context.txtTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.md),
                        AppElevatedButton(
                          label: "Order Now",
                          onPressed: () {
                            context.push(RoutePaths.checkoutForm);
                          },
                        ),
                      ],
                    );
                  } else if (role == Role.seller) {
                    return Row(
                      spacing: AppSizes.sm,
                      children: <Widget>[
                        AppOutlineButton(
                          label: "Edit",
                          icon: const Icon(Icons.edit),
                          onPressed: () =>
                              context.push(RoutePaths.createProduct),
                        ).expanded,
                        AppElevatedButton(
                          label: "Boost",
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.white,
                          ),
                          onPressed: () =>
                              context.push(RoutePaths.productBoost),
                        ).expanded,
                      ],
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

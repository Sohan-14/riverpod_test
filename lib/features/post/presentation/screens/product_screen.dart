import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';
import '../widget/product_card.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.md,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                AppElevatedButton(
                  onPressed: () {
                    context.push(RoutePaths.createProduct);
                  },
                  label: "Create Product",
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                ).expanded,
                const SizedBox(width: AppSizes.md),
                AppOutlineButton(
                  onPressed: () {
                    context.push(RoutePaths.productOrders);
                  },
                  label: "Product Orders",
                ).expanded,
              ],
            ),

            const SizedBox(height: AppSizes.lg),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("All Products", style: context.txtTheme.titleLarge),
              ],
            ),

            const SizedBox(height: AppSizes.md),

            GridView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return const ProductCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}

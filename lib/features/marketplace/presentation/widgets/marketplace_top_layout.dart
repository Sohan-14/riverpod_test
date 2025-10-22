import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class MarketplaceTopLayout extends StatelessWidget {
  const MarketplaceTopLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Products",
          style: context.txtTheme.bodyLarge,
        ),

        Row(
          spacing: 8.0,
          children: <Widget>[
            AppOutlineButton(
              onPressed: () {
                context.push(RoutePaths.localGems);
              },
              width: 200,
              label: 'Try Local Gems',
            ),

            GestureDetector(
              onTap: () {
                context.push(RoutePaths.cart);
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: <Widget>[
                    const ImageLoader(
                      imagePath: AppIcons.cart,
                      width: 16.0,
                      height: 16.0,
                    ),
                    Text(
                      "Cart",
                      style: context.txtTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/shared/widgets/image_loader.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.md,
            horizontal: AppSizes.screenHorizontal,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Products",
                    style: context.txtTheme.bodyLarge,
                  ),

                  AppOutlineButton(
                    onPressed: () {},
                    width: 100,
                    label: 'Try Local Gems',
                  ),

                  Container(
                    decoration: const BoxDecoration(),
                    child: const Column(
                      children: <Widget>[
                        ImageLoader(
                          imagePath: AppIcons.cart,
                          width: 16.0,
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

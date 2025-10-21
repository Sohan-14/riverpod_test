import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../widgets/marketplace_card.dart';
import '../widgets/marketplace_top_layout.dart';

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
              const MarketplaceTopLayout(),
              const SizedBox(
                height: AppSizes.md,
              ),
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
                  return const MarketPlaceCard();
                },
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

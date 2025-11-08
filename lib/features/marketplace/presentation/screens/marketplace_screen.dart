import 'package:app/core/config/colors.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/shared/provider/role_provider.dart';
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
                  childAspectRatio: .7,
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
      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final Role role = ref.read(selectedRoleProvider);
          if (role == Role.seller) {
            return ClipOval(
              child: FloatingActionButton(
                foregroundColor: AppColors.primary,
                backgroundColor: AppColors.primary,
                onPressed: () {
                  context.push(RoutePaths.createProduct);
                },
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

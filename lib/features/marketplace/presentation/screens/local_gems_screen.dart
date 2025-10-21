import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../widgets/store_card.dart';

class LocalGemsScreen extends StatelessWidget {
  const LocalGemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Local Gems",
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
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  return const StoreCard();
                },
                separatorBuilder: (_, _) => const SizedBox(
                  height: AppSizes.md,
                ),
                itemCount: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../widgets/onboarding_title_section.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.md,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: AppSizes.spaceBetweenSections),

              OnboardingTitleSection(
                title: "Choose Your Role",
                subTitle:
                    "Select how you want to use Fouta. You can expand later.",
              ),

              SizedBox(height: AppSizes.spaceBetweenSections),

              DeliveryDriverWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryDriverWidget extends StatelessWidget {
  const DeliveryDriverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png', // Add your image here
            height: 100,
          ),
          const SizedBox(height: 16),
          const Text(
            'Delivery Driver',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Deliver products and track your earnings.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

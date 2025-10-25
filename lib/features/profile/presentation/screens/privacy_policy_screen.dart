import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Privacy Policy",
        showBackBtn: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.md,
        ),
        child: Column(
          children: <Widget>[
            Text(
              "App is a smart and simple app designed to bring people together—when life happens to bring them to the same place. Whether you're traveling for business, planning a getaway, or just passing through, it helps you discover when friends, family, or colleagues will be in the same city as you—without needing to coordinate every detail. We believe that some of life’s most meaningful moments happen when connections are made in person. it makes those moments easier to find.",
              style: context.txtTheme.bodyMedium?.copyWith(
                height: 2.0,
                wordSpacing: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

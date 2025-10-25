import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Contact Us",
        showBackBtn: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.md,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Contact Information",
              style: context.txtTheme.titleLarge?.copyWith(
                height: 2.0,
                wordSpacing: 2.0,
              ),
            ),
            Text(
              "New York, USA",
              style: context.txtTheme.bodyMedium?.copyWith(
                height: 2.0,
                wordSpacing: 2.0,
              ),
            ),
            Text(
              "+545564i6545546",
              style: context.txtTheme.bodyMedium?.copyWith(
                height: 2.0,
                wordSpacing: 2.0,
              ),
            ),
            Text(
              "demo@gmail.com",
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

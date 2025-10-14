import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/extensions/context_extensions.dart';

class AuthTitleSection extends StatelessWidget {
  final String title;
  final String subTitle;

  const AuthTitleSection({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppSizes.sm,
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.txtTheme.headlineLarge,
        ),

        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: context.txtTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/colors.dart';

class PostCard extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTapCallback;

  const PostCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: .4),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          spacing: AppSizes.sm,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: icon,
            ),
            Text(
              label,
              style: context.txtTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

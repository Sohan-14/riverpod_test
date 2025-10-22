import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';

class SettingItems extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTapCallback;

  const SettingItems({
    super.key,
    required this.label,
    required this.onTapCallback,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: .2),
        border: Border.all(color: AppColors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        spacing: AppSizes.md,
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.black,
            size: 24,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: context.txtTheme.bodyLarge,
              ),
            ],
          ),

          const Spacer(),

          const Icon(
            Icons.keyboard_arrow_right,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}

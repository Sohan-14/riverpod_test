
import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';

class InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const InfoItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.sm,
      ),
      decoration: BoxDecoration(
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
              Text(
                value,
                style: context.txtTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
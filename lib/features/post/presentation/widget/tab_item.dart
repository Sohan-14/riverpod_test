import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.selectedIndex,
    required this.index,
    required this.label,
  });

  final int selectedIndex;
  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.primary, width: 1.0),
        color: selectedIndex == index ? AppColors.primary : Colors.transparent,
      ),
      child: Row(
        spacing: AppSizes.sm,
        children: <Widget>[
          Text(
            label,
            style: context.txtTheme.bodyMedium?.copyWith(
              color: selectedIndex == index ? AppColors.white : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

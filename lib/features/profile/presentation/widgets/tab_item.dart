import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.selectedIndex,
    required this.index,
    required this.label,
    required this.icon,
  });

  final int selectedIndex;
  final int index;
  final String label;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.sm,
        vertical: AppSizes.xs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: selectedIndex == index
            ? Border.all(color: AppColors.white, width: 1.0)
            : null,
      ),
      child: Row(
        spacing: AppSizes.sm,
        children: <Widget>[
          ImageLoader(
            imagePath: icon,
            color: AppColors.white,
            width: 24.0,
            height: 24.0,
          ),
          Text(
            label,
            style: context.txtTheme.bodyMedium?.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
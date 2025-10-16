import 'package:flutter/material.dart';

import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class RoleContainer extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTapCallback;

  const RoleContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        constraints: const BoxConstraints(minHeight: 220),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.black, width: 1.0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
                left: 4,
                right: 4,
                bottom: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ImageLoader(
                    imagePath: icon,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    subtitle,
                    style: context.txtTheme.bodySmall,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            Positioned(
              left: -0,
              top: -1,
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.md,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  border: Border(
                    bottom: BorderSide(color: AppColors.primary),
                    right: BorderSide(color: AppColors.primary),
                    // left: BorderSide(color: AppColors.primary),
                  ),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: context.txtTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ).centered,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

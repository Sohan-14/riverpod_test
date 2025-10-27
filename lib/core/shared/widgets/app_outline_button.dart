import 'package:flutter/material.dart';

import '../../extensions/context_extensions.dart';
import '../../config/colors.dart';

class AppOutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final Widget? icon;
  final double? height;
  final double? width;
  final Color? outlineColor;

  const AppOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.outlineColor,
    this.height = 48.0,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isEnabled && !isLoading ? onPressed : null,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(
          width ?? double.infinity,
          height!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(
          color: isEnabled
              ? outlineColor ?? AppColors.primary
              : AppColors.grey, // Border color
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (icon != null) ...<Widget>[
                  icon!,
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: context.txtTheme.bodyMedium?.copyWith(
                    color: outlineColor,
                  ),
                ),
              ],
            ),
    );
  }
}

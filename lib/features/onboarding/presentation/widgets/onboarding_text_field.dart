import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class OnboardingTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? errorText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final int minLine;
  final int maxLine;

  const OnboardingTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.obscureText = false,
    this.onChanged,
    this.minLine = 1,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (PointerDownEvent pointerDownEvent) => context.hideKeyboard,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: context.txtTheme.bodyMedium,
      minLines: minLine,
      maxLines: maxLine,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  prefixIcon,
                  size: 20.0,
                ),
              )
            : null,
        alignLabelWithHint: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        errorText: errorText,
      ),
    );
  }
}

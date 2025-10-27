import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? errorText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (PointerDownEvent pointerDownEvent) => context.hideKeyboard,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      textAlign: TextAlign.start,
      style: context.txtTheme.bodyMedium,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  prefixIcon,
                  size: 20.0,
                ),
              )
            : null,
        suffixIcon: suffixIcon,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        errorText: errorText,
      ),
    );
  }
}

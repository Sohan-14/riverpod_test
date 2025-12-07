import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? errorText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingCompleted;

  const AuthTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.onEditingCompleted
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (PointerDownEvent pointerDownEvent) => context.hideKeyboard,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onEditingComplete: onEditingCompleted,
      style: context.txtTheme.bodyMedium,
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
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  suffixIcon,
                  size: 20.0,
                ),
              )
            : null,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        errorText: errorText,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool? filled;
  final String? Function(String?)? validator;
  final void Function(String?)? onButtonPressed;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double borderRadius = 18.0;

  final void Function(String)? onSubmitted;

  final bool? enabled;

  final TextInputAction? textInputAction;

  const InputTextField({
    super.key,
    required this.label,
    required this.controller,
    this.filled,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
    this.onButtonPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.enabled,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textInputAction: textInputAction,
      enabled: enabled,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        filled: filled ?? true,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),

        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: suffixIcon!,
                onPressed: () {
                  if (onButtonPressed != null) {
                    onButtonPressed!(null);
                  }
                },
              )
            : null,
      ),
    );
  }
}

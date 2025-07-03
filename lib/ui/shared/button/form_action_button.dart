import 'package:flutter/material.dart';

class FormActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool? isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Widget? icon;
  final bool fullWidth;

  const FormActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.icon,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final loading = isLoading ?? false;
    final theme = Theme.of(context);

    final buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(18.0),
          ),
          minimumSize: Size(
            fullWidth ? double.infinity : (width ?? 0),
            height ?? 48,
          ),
        )
        .copyWith(elevation: ButtonStyleButton.allOrNull(0))
        .merge(theme.elevatedButtonTheme.style);

    Widget buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[icon!, const SizedBox(width: 8)],
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );

    Widget loadingContent = SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: (foregroundColor ?? theme.colorScheme.onPrimary).withOpacity(
          0.8,
        ),
      ),
    );

    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: buttonStyle,
      child: loading ? loadingContent : buttonContent,
    );
  }
}

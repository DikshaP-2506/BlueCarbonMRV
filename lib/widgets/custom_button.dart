import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool destructive;
  final bool outline;
  final bool secondary;
  final bool ghost;
  final bool link;
  final bool disabled;
  final Widget? icon;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;

  const CustomButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.destructive = false,
    this.outline = false,
    this.secondary = false,
    this.ghost = false,
    this.link = false,
    this.disabled = false,
    this.icon,
    this.width,
    this.height,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    ButtonStyle style;
    if (destructive) {
      style = TextButton.styleFrom(
        backgroundColor: color ?? colorScheme.error,
        foregroundColor: textColor ?? colorScheme.onError,
      );
    } else if (outline) {
      style = OutlinedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
      );
    } else if (secondary) {
      style = TextButton.styleFrom(
        backgroundColor: color ?? colorScheme.secondary,
        foregroundColor: textColor ?? colorScheme.onSecondary,
      );
    } else if (ghost) {
      style = TextButton.styleFrom(
        backgroundColor: color ?? Colors.transparent,
        foregroundColor: textColor ?? colorScheme.primary,
      );
    } else if (link) {
      style = TextButton.styleFrom(
        foregroundColor: textColor ?? color ?? colorScheme.primary,
      );
    } else {
      style = TextButton.styleFrom(
        backgroundColor: color ?? colorScheme.primary,
        foregroundColor: textColor ?? colorScheme.onPrimary,
      );
    }
    return SizedBox(
      width: width,
      height: height,
      child: TextButton.icon(
        icon: icon ?? const SizedBox.shrink(),
        label: Text(label),
        onPressed: disabled ? null : onPressed,
        style: style,
      ),
    );
  }
}

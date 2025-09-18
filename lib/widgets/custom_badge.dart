import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String label;
  final Color? color;
  final TextStyle? textStyle;

  const CustomBadge({Key? key, required this.label, this.color, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: textStyle ?? Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),
      ),
    );
  }
}

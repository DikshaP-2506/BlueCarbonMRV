import 'package:flutter/material.dart';

class CustomSeparator extends StatelessWidget {
  final double thickness;
  final Color? color;

  const CustomSeparator({Key? key, this.thickness = 1.0, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: color ?? Theme.of(context).dividerColor,
    );
  }
}

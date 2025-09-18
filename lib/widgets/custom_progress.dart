import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  final double value;
  final double? minHeight;

  const CustomProgress({Key? key, required this.value, this.minHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      minHeight: minHeight ?? 4.0,
    );
  }
}

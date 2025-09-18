import 'package:flutter/material.dart';

class CustomTextarea extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final int minLines;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  const CustomTextarea({
    Key? key,
    required this.controller,
    this.label,
    this.hintText,
    this.minLines = 3,
    this.maxLines = 5,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

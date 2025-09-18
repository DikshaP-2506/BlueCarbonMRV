import 'package:flutter/material.dart';

class CustomSelect<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? hint;

  const CustomSelect({Key? key, required this.items, this.value, this.onChanged, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      hint: hint != null ? Text(hint!) : null,
      isExpanded: true,
    );
  }
}

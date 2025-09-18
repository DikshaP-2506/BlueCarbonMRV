import 'package:flutter/material.dart';
import '../theme.dart';

class ThemeProvider extends StatelessWidget {
  final Widget child;
  const ThemeProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: child,
    );
  }
}

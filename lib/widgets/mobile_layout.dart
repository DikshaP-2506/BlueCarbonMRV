import 'package:flutter/material.dart';
import 'chatbot_fab.dart';

class MobileLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final bool showChatbot;

  const MobileLayout({Key? key, required this.child, this.title, this.actions, this.drawer, this.bottomNavigationBar, this.showChatbot = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!), actions: actions) : null,
      drawer: drawer,
      body: SafeArea(child: child),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: showChatbot ? const ChatbotFAB() : null,
    );
  }
}

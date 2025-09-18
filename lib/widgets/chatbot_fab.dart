import 'package:flutter/material.dart';

class ChatbotFAB extends StatelessWidget {
  final VoidCallback? onPressed;
  const ChatbotFAB({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'chatbot-fab',
      backgroundColor: Colors.blue,
      child: const Icon(Icons.smart_toy, color: Colors.white), // agent/robot icon
      onPressed: onPressed ?? () {
        // TODO: Open chatbot dialog or screen
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Chatbot'),
            content: const Text('Chatbot coming soon!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}

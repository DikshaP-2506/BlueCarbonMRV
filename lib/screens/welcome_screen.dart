import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5F7FA), Color(0xFFE4ECF7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Center(
                    child: Icon(Icons.eco, color: Colors.white, size: 48),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Welcome!',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Manage blue carbon restoration projects and earn verified carbon credits.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'This is a mobile-based app deployed on the web for demonstration purposes. THIS IS NOT A FINAL PROTOTYPE.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  label: 'Get Started',
                  height: 48,
                  width: double.infinity,
                  onPressed: () => Navigator.pushReplacementNamed(context, '/auth'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

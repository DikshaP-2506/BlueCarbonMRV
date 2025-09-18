
import 'package:flutter/material.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_separator.dart';
import '../widgets/custom_label.dart';

class WalletSetupScreen extends StatefulWidget {
  const WalletSetupScreen({Key? key}) : super(key: key);

  @override
  State<WalletSetupScreen> createState() => _WalletSetupScreenState();
}

class _WalletSetupScreenState extends State<WalletSetupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isLoading = false;
  String? error;

  void createWallet() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    await Future.delayed(const Duration(seconds: 2)); // Simulate wallet creation
    setState(() {
      isLoading = false;
    });
    if (nameController.text.isEmpty || passController.text.isEmpty) {
      setState(() {
        error = 'Please fill all fields.';
      });
      return;
    }
    // Navigate to wallet screen (stub)
    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/wallet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      title: 'Wallet Setup',
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: CustomCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.account_balance_wallet, size: 48, color: Colors.green),
                const SizedBox(height: 16),
                const CustomLabel(
                  text: 'Create Your Wallet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const CustomLabel(
                  text: 'Set up your digital wallet to store and manage your IBC tokens securely.',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 24),
                CustomInput(
                  controller: nameController,
                  label: 'Wallet Name',
                  hintText: 'e.g. My Green Wallet',
                ),
                const SizedBox(height: 16),
                CustomInput(
                  controller: passController,
                  label: 'Password',
                  hintText: 'Enter a strong password',
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                if (error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(error!, style: const TextStyle(color: Colors.red)),
                  ),
                CustomButton(
                  label: isLoading ? 'Creating Wallet...' : 'Create Wallet',
                  onPressed: isLoading ? null : createWallet,
                  height: 44,
                ),
                const SizedBox(height: 12),
                const CustomSeparator(),
                const SizedBox(height: 12),
                CustomButton(
                  label: 'Import Existing Wallet',
                  outline: true,
                  onPressed: () {
                    // Import wallet logic (stub)
                  },
                  height: 44,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

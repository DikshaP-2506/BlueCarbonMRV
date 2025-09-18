
import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/mobile_layout.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int step = 1;
  final Map<String, String> formData = {
    'ngoName': '',
    'registrationId': '',
    'contactEmail': '',
    'contactPhone': '',
    'leadName': '',
    'leadEmail': '',
    'leadPhone': '',
  };

  void handleInputChange(String field, String value) {
    setState(() {
      formData[field] = value;
    });
  }

  void handleNext() {
    setState(() {
      if (step < 2) {
        step++;
      } else {
        // Simulate submit and create wallet
        Navigator.pushReplacementNamed(context, '/wallet-setup');
      }
    });
  }

  void handleBack() {
    setState(() {
      if (step > 1) {
        step--;
      } else {
        Navigator.of(context).maybePop();
      }
    });
  }

  double get progress => (step / 2) * 100;

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      title: 'Register',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  label: 'Back',
                  ghost: true,
                  icon: const Icon(Icons.arrow_back, size: 18),
                  onPressed: handleBack,
                  height: 36,
                ),
                CustomButton(
                  label: 'Guide',
                  ghost: true,
                  icon: const Icon(Icons.play_arrow, size: 18),
                  onPressed: () {},
                  height: 36,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Step $step of 2', style: Theme.of(context).textTheme.bodySmall),
                Text('${progress.round()}%', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: 4),
            LinearProgressIndicator(value: progress / 100, minHeight: 6),
            const SizedBox(height: 24),
            // Logo and Title
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(Icons.apartment, color: Colors.white, size: 36),
              ),
            ),
            const SizedBox(height: 8),
            Text('Organization Registration', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              step == 1 ? 'Tell us about your organization' : 'Lead contact information',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step == 1 ? 'Organization Details' : 'Lead Information',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  if (step == 1) ...[
                    CustomInput(
                      controller: TextEditingController(text: formData['ngoName']),
                      label: 'NGO/Community Name *',
                      hintText: 'Enter organization name',
                      onChanged: (val) => handleInputChange('ngoName', val),
                    ),
                    const SizedBox(height: 12),
                    CustomInput(
                      controller: TextEditingController(text: formData['registrationId']),
                      label: 'Registration ID *',
                      hintText: 'Enter registration number',
                      onChanged: (val) => handleInputChange('registrationId', val),
                    ),
                    const SizedBox(height: 12),
                    CustomInput(
                      controller: TextEditingController(text: formData['contactEmail']),
                      label: 'Contact Email *',
                      hintText: 'organization@example.com',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) => handleInputChange('contactEmail', val),
                    ),
                    const SizedBox(height: 12),
                    CustomInput(
                      controller: TextEditingController(text: formData['contactPhone']),
                      label: 'Contact Phone *',
                      hintText: '+91 XXXXX XXXXX',
                      keyboardType: TextInputType.phone,
                      onChanged: (val) => handleInputChange('contactPhone', val),
                    ),
                  ] else ...[
                    CustomInput(
                      controller: TextEditingController(text: formData['leadName']),
                      label: "Lead's Full Name *",
                      hintText: 'Enter full name',
                      onChanged: (val) => handleInputChange('leadName', val),
                    ),
                    const SizedBox(height: 12),
                    CustomInput(
                      controller: TextEditingController(text: formData['leadEmail']),
                      label: "Lead's Email *",
                      hintText: 'lead@example.com',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) => handleInputChange('leadEmail', val),
                    ),
                    const SizedBox(height: 12),
                    CustomInput(
                      controller: TextEditingController(text: formData['leadPhone']),
                      label: "Lead's Phone *",
                      hintText: '+91 XXXXX XXXXX',
                      keyboardType: TextInputType.phone,
                      onChanged: (val) => handleInputChange('leadPhone', val),
                    ),
                  ],
                  const SizedBox(height: 24),
                  CustomButton(
                    label: step == 1 ? 'Next Step' : 'Submit & Create Wallet',
                    onPressed: handleNext,
                    height: 44,
                    icon: step == 1 ? const Icon(Icons.arrow_forward, size: 18) : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_label.dart';
import '../widgets/custom_separator.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool showPassword = false;
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleSubmit() {
    if (isLogin) {
      // Simulate login success
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      // Navigate to organization registration
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5F7FA), Color(0xFFE4ECF7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    label: 'Back',
                    icon: const Icon(Icons.arrow_back, size: 18),
                    ghost: true,
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  CustomButton(
                    label: 'Guide',
                    icon: const Icon(Icons.play_arrow, size: 18),
                    ghost: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'BC',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          isLogin ? 'Welcome Back' : 'Create Account',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isLogin ? 'Sign in to your account' : 'Join the blue carbon community',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 20),
                        CustomCard(
                          child: Column(
                            children: [
                              Text(
                                isLogin ? 'Sign In' : 'Sign Up',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 16),
                              Form(
                                child: Column(
                                  children: [
                                    // Email/Phone
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomLabel(text: 'Email or Phone'),
                                    ),
                                    const SizedBox(height: 4),
                                    CustomInput(
                                      controller: contactController,
                                      hintText: 'Enter email or phone number',
                                      prefixIcon: const Icon(Icons.mail_outline, size: 18),
                                    ),
                                    const SizedBox(height: 16),
                                    // Password
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomLabel(text: 'Password'),
                                    ),
                                    const SizedBox(height: 4),
                                    Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        CustomInput(
                                          controller: passwordController,
                                          hintText: 'Enter your password',
                                          obscureText: !showPassword,
                                          prefixIcon: const Icon(Icons.lock_outline, size: 18),
                                        ),
                                        IconButton(
                                          icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
                                          onPressed: () => setState(() => showPassword = !showPassword),
                                        ),
                                      ],
                                    ),
                                    if (isLogin)
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: const Text('Forgot Password?', style: TextStyle(fontSize: 12)),
                                        ),
                                      ),
                                    const SizedBox(height: 12),
                                    CustomButton(
                                      label: isLogin ? 'Sign In' : 'Create Account',
                                      width: double.infinity,
                                      height: 44,
                                      onPressed: handleSubmit,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              CustomSeparator(),
                              const SizedBox(height: 16),
                              // Alternative Auth Methods
                              CustomButton(
                                label: 'Sign in with OTP',
                                outline: true,
                                width: double.infinity,
                                height: 44,
                                icon: const Icon(Icons.phone, size: 18),
                                onPressed: () {},
                              ),
                              const SizedBox(height: 8),
                              CustomButton(
                                label: 'Sign in with Google',
                                outline: true,
                                width: double.infinity,
                                height: 44,
                                icon: const Icon(Icons.g_mobiledata, size: 24),
                                onPressed: () {},
                              ),
                              const SizedBox(height: 16),
                              // Toggle Auth Mode
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    isLogin ? "Don't have an account?" : 'Already have an account?',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  TextButton(
                                    onPressed: () => setState(() => isLogin = !isLogin),
                                    child: Text(isLogin ? 'Sign Up' : 'Sign In'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';
import 'screens/collect_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/register_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/wallet_setup_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/project_detail_screen.dart';
import 'theme.dart';

void main() {
  runApp(const SIHCarbonMRVApp());
}

class SIHCarbonMRVApp extends StatelessWidget {
  const SIHCarbonMRVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIH-CarbonMRV',
      theme: appTheme,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/collect': (context) => const CollectScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/projects': (context) => const ProjectsScreen(),
        '/projects/new': (context) => const ProjectsScreen(),
        '/register': (context) => const RegisterScreen(),
        '/wallet': (context) => const WalletScreen(),
        '/wallet-setup': (context) => const WalletSetupScreen(),
      },
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '');
        if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'projects') {
          final id = int.tryParse(uri.pathSegments[1]);
          if (id != null) {
            return MaterialPageRoute(
              builder: (context) => ProjectDetailScreen(projectId: id),
              settings: settings,
            );
          }
        }
        return null;
      },
    );
  }
}

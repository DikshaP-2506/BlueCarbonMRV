import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/custom_bottom_nav.dart';

class ProjectDetailScreen extends StatelessWidget {
  final int projectId;
  const ProjectDetailScreen({Key? key, required this.projectId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // In a real app, fetch project details using projectId
    return MobileLayout(
      title: 'Project Details',
      child: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Project ID: #$projectId', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            const Text('Project details would be shown here.'),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/dashboard');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/projects');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/collect');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/wallet');
              break;
          }
        },
      ),
    );
  }
}

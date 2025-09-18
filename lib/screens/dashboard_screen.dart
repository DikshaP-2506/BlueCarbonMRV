import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_badge.dart';
import '../widgets/custom_progress.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/custom_bottom_nav.dart';

class DashboardScreen extends StatelessWidget {
  final bool isOnline = true; // Simulated online status
  DashboardScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> projects = [
    {
      'id': 1,
      'name': 'Sundarbans Mangrove Restoration',
      'location': 'West Bengal, India',
      'status': 'Active',
      'progress': 75,
      'area': 50,
      'startDate': '2024-01-15',
      'estimatedCredits': 1250,
      'currentCredits': 940,
      'species': 'Rhizophora mucronata',
      'survivalRate': 85,
    },
    {
      'id': 2,
      'name': 'Pichavaram Wetland Conservation',
      'location': 'Tamil Nadu, India',
      'status': 'Pending Approval',
      'progress': 0,
      'area': 25,
      'startDate': '2024-03-01',
      'estimatedCredits': 625,
      'currentCredits': 0,
      'species': 'Avicennia marina',
      'survivalRate': 0,
    },
    {
      'id': 3,
      'name': 'Bhitarkanika Blue Carbon',
      'location': 'Odisha, India',
      'status': 'Verification Pending',
      'progress': 100,
      'area': 75,
      'startDate': '2023-08-10',
      'estimatedCredits': 1875,
      'currentCredits': 1875,
      'species': 'Bruguiera gymnorrhiza',
      'survivalRate': 92,
    },
  ];

  Color getStatusColor(String status, BuildContext context) {
    switch (status) {
      case 'Active':
        return Theme.of(context).colorScheme.primary;
      case 'Pending Approval':
        return Colors.yellow[700]!;
      case 'Verification Pending':
        return Colors.blue[700]!;
      case 'Completed':
        return Colors.green[700]!;
      default:
        return Colors.grey;
    }
  }

  Icon getStatusIcon(String status) {
    switch (status) {
      case 'Active':
        return const Icon(Icons.trending_up, size: 16);
      case 'Pending Approval':
        return const Icon(Icons.access_time, size: 16);
      case 'Verification Pending':
        return const Icon(Icons.remove_red_eye, size: 16);
      case 'Completed':
        return const Icon(Icons.check_circle, size: 16);
      default:
        return const Icon(Icons.error_outline, size: 16);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Top status/actions row
    Widget statusBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomBadge(
              label: isOnline ? 'Online' : 'Offline',
              color: isOnline ? Colors.green : Colors.orange,
            ),
            const SizedBox(width: 8),
            CustomButton(
              label: 'Sync Data',
              outline: true,
              height: 32,
              onPressed: () {}, // TODO: Add sync logic
            ),
          ],
        ),
        CustomButton(
          label: 'Guide',
          ghost: true,
          icon: const Icon(Icons.help_outline, size: 18),
          height: 32,
          onPressed: () {}, // TODO: Add guide/help logic
        ),
      ],
    );
    final int totalProjects = projects.length;
    final int activeProjects = projects.where((p) => p['status'] == 'Active').length;
    final int totalCredits = projects.fold(0, (sum, p) => sum + (p['currentCredits'] as int));
    final int totalArea = projects.fold(0, (sum, p) => sum + (p['area'] as int));

    return MobileLayout(
      title: 'Dashboard',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            statusBar,
            const SizedBox(height: 16),
            // Welcome Section
            Text(
              'Welcome back, Priya!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Here's an overview of your restoration projects",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            // Summary Cards
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                CustomCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.eco, color: Colors.green, size: 22),
                      ),
                      const SizedBox(height: 4),
                      Text('$totalProjects', style: Theme.of(context).textTheme.titleLarge),
                      const Text('Total Projects', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                CustomCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.trending_up, color: Colors.blue, size: 22),
                      ),
                      const SizedBox(height: 4),
                      Text('$activeProjects', style: Theme.of(context).textTheme.titleLarge),
                      const Text('Active Projects', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                CustomCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.emoji_events, color: Colors.orange, size: 22),
                      ),
                      const SizedBox(height: 4),
                      Text('$totalCredits', style: Theme.of(context).textTheme.titleLarge),
                      const Text('Carbon Credits', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                CustomCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.place, color: Colors.green, size: 22),
                      ),
                      const SizedBox(height: 4),
                      Text('$totalArea', style: Theme.of(context).textTheme.titleLarge),
                      const Text('Hectares', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Latest Projects Section (top 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Latest Projects', style: Theme.of(context).textTheme.titleMedium),
                CustomButton(
                  label: 'New',
                  icon: const Icon(Icons.add, size: 16),
                  onPressed: () => Navigator.pushNamed(context, '/projects/new'),
                  height: 32,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              children: projects.take(2).map((project) {
                return CustomCard(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project['name'],
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.place, size: 14, color: Colors.grey),
                                    const SizedBox(width: 2),
                                    Text(
                                      project['location'],
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomBadge(
                            label: project['status'],
                            color: getStatusColor(project['status'], context),
                            textStyle: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (project['progress'] > 0)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Progress', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                Text('${project['progress']}%', style: const TextStyle(fontSize: 12)),
                              ],
                            ),
                            CustomProgress(value: (project['progress'] as int) / 100),
                          ],
                        ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('${project['area']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                              const Text('Area', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('${project['currentCredits']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                              const Text('Credits', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('${project['survivalRate']}%', style: const TextStyle(fontWeight: FontWeight.bold)),
                              const Text('Survival', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              label: 'View Details',
                              outline: true,
                              height: 32,
                              onPressed: () => Navigator.pushNamed(context, '/projects/${project['id']}'),
                            ),
                          ),
                          if (project['status'] == 'Active')
                            const SizedBox(width: 8),
                          if (project['status'] == 'Active')
                            Expanded(
                              child: CustomButton(
                                label: 'Collect Data',
                                height: 32,
                                onPressed: () => Navigator.pushNamed(context, '/collect', arguments: {'project': project['id']}),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            // Quick Actions
            CustomCard(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Quick Actions', style: Theme.of(context).textTheme.titleMedium),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    label: 'Start New Project',
                    outline: true,
                    width: double.infinity,
                    height: 44,
                    icon: const Icon(Icons.add, size: 18),
                    onPressed: () => Navigator.pushNamed(context, '/projects/new'),
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    label: 'Collect Field Data',
                    outline: true,
                    width: double.infinity,
                    height: 44,
                    icon: const Icon(Icons.eco, size: 18),
                    onPressed: () => Navigator.pushNamed(context, '/collect'),
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    label: 'View Carbon Credits',
                    outline: true,
                    width: double.infinity,
                    height: 44,
                    icon: const Icon(Icons.emoji_events, size: 18),
                    onPressed: () => Navigator.pushNamed(context, '/wallet'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 0,
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

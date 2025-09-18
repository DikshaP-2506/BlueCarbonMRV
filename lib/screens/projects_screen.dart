import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_select.dart';
import '../widgets/custom_textarea.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_badge.dart';
import '../widgets/custom_progress.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  // Controllers for all text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController objectivesController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController baselineBiomassController = TextEditingController();
  final TextEditingController survivalGoalController = TextEditingController();
  final TextEditingController coordinatesController = TextEditingController();
  bool showNewProjectForm = false;
  final Map<String, String> formData = {
    'name': '',
    'description': '',
    'objectives': '',
    'ecosystemType': '',
    'methodology': '',
    'area': '',
    'startDate': '',
    'endDate': '',
    'baselineBiomass': '',
    'targetSpecies': '',
    'survivalGoal': '',
    'coordinates': '',
    'consentForm': '',
    'implementationPlan': '',
    'eia': '',
    'financialPlan': '',
  };

  final List<String> ecosystemTypes = [
    'Mangrove Forest',
    'Salt Marsh',
    'Seagrass Meadow',
    'Coastal Wetland',
    'Tidal Creek',
  ];

  final List<String> restorationMethods = [
    'Natural Regeneration',
    'Direct Seeding',
    'Seedling Plantation',
    'Hydrological Restoration',
    'Community-based Restoration',
  ];

  final List<String> targetSpecies = [
    'Rhizophora mucronata',
    'Avicennia marina',
    'Bruguiera gymnorrhiza',
    'Ceriops decandra',
    'Sonneratia apetala',
  ];


  void handleInputChange(String field, String value) {
    setState(() {
      formData[field] = value;
    });
  }

  List<Widget> _buildAllFields() {
    return [
      CustomInput(
        controller: nameController,
        label: 'Project Name',
        onChanged: (v) => handleInputChange('name', v),
      ),
      const SizedBox(height: 12),
      CustomTextarea(
        controller: descriptionController,
        label: 'Description',
        onChanged: (v) => handleInputChange('description', v),
      ),
      const SizedBox(height: 12),
      CustomTextarea(
        controller: objectivesController,
        label: 'Objectives',
        onChanged: (v) => handleInputChange('objectives', v),
      ),
      const SizedBox(height: 12),
      CustomSelect<String>(
        value: formData['ecosystemType']!.isEmpty ? null : formData['ecosystemType'],
        items: ecosystemTypes.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
        onChanged: (v) => handleInputChange('ecosystemType', v ?? ''),
        hint: 'Ecosystem Type',
      ),
      const SizedBox(height: 12),
      CustomSelect<String>(
        value: formData['methodology']!.isEmpty ? null : formData['methodology'],
        items: restorationMethods.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
        onChanged: (v) => handleInputChange('methodology', v ?? ''),
        hint: 'Restoration Methodology',
      ),
      const SizedBox(height: 12),
      CustomInput(
        controller: areaController,
        label: 'Area (ha)',
        onChanged: (v) => handleInputChange('area', v),
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 12),
      CustomInput(
        controller: startDateController,
        label: 'Start Date',
        onChanged: (v) => handleInputChange('startDate', v),
        keyboardType: TextInputType.datetime,
      ),
      const SizedBox(height: 12),
      CustomInput(
        controller: endDateController,
        label: 'End Date',
        onChanged: (v) => handleInputChange('endDate', v),
        keyboardType: TextInputType.datetime,
      ),
      const SizedBox(height: 12),
      CustomInput(
        controller: baselineBiomassController,
        label: 'Baseline Biomass',
        onChanged: (v) => handleInputChange('baselineBiomass', v),
      ),
      const SizedBox(height: 12),
      CustomSelect<String>(
        value: formData['targetSpecies']!.isEmpty ? null : formData['targetSpecies'],
        items: targetSpecies.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
        onChanged: (v) => handleInputChange('targetSpecies', v ?? ''),
        hint: 'Target Species',
      ),
      const SizedBox(height: 12),
      CustomInput(
        controller: survivalGoalController,
        label: 'Survival Goal (%)',
        onChanged: (v) => handleInputChange('survivalGoal', v),
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 12),
      // Polygon Coordinates (drawn on map)
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CustomInput(
              controller: coordinatesController,
              label: 'Polygon Coordinates',
              hintText: 'Draw polygon on map',
              readOnly: true,
              onChanged: (v) => handleInputChange('coordinates', v),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            icon: const Icon(Icons.map),
            label: const Text('Draw on Map'),
            onPressed: () {
              // TODO: Open map picker and update coordinatesController
            },
            style: ElevatedButton.styleFrom(minimumSize: const Size(40, 48)),
          ),
        ],
      ),
      const SizedBox(height: 12),
      // File upload buttons (stubbed)
      ElevatedButton.icon(
        icon: const Icon(Icons.upload_file),
        label: Text(formData['consentForm']!.isEmpty ? 'Upload Community Consent' : 'Community Consent Uploaded'),
        onPressed: () {},
      ),
      const SizedBox(height: 12),
      ElevatedButton.icon(
        icon: const Icon(Icons.upload_file),
        label: Text(formData['landTenure'] == null || formData['landTenure']!.isEmpty ? 'Upload Land Tenure Agreement' : 'Land Tenure Agreement Uploaded'),
        onPressed: () {},
      ),
    ];
  }

  Future<void> handleSubmit() async {
    // TODO: Use connectivity_plus to check real connectivity
    // For now, always save locally (stub)
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saved locally (offline mode)')));
    setState(() {
      showNewProjectForm = false;
    });
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    // Example static projects list (should be replaced with real data source)
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

    return MobileLayout(
      title: showNewProjectForm ? 'New Project' : 'All Projects',
      child: showNewProjectForm
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          setState(() {
                            showNewProjectForm = false;
                          });
                        },
                      ),
                      Text('New Project', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ..._buildAllFields(),
                  const SizedBox(height: 24),
                  Center(
                    child: CustomButton(
                      label: 'Submit',
                      onPressed: handleSubmit,
                      height: 44,
                    ),
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('All Projects', style: Theme.of(context).textTheme.titleMedium),
                    CustomButton(
                      label: 'New Project',
                      icon: const Icon(Icons.add, size: 16),
                      onPressed: () {
                        setState(() {
                          showNewProjectForm = true;
                        });
                      },
                      height: 32,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...projects.map((project) {
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
                              color: Colors.blue,
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
              ],
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

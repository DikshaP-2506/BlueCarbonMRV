import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_badge.dart';
import '../widgets/custom_select.dart';
import '../widgets/custom_textarea.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/custom_bottom_nav.dart';

class CollectScreen extends StatefulWidget {
  const CollectScreen({Key? key}) : super(key: key);

  @override
  State<CollectScreen> createState() => _CollectScreenState();
}

class _CollectScreenState extends State<CollectScreen> {
  String selectedProject = '';
  bool isOnline = true;
  List<String> capturedMedia = [];
  Map<String, String> formData = {
    'gpsCoords': '22.3511° N, 88.2420° E',
    'timestamp': '',
    'saplingCount': '',
    'healthRating': '',
    'speciesObserved': '',
    'waterSalinity': '',
    'sedimentDepth': '',
    'notes': '',
  };

  final List<Map<String, dynamic>> projects = [
    {'id': 1, 'name': 'Sundarbans Mangrove Restoration', 'status': 'Active'},
    {'id': 3, 'name': 'Bhitarkanika Blue Carbon', 'status': 'Active'},
  ];

  final List<Map<String, dynamic>> healthRatings = [
    {
      'value': 'excellent',
      'label': 'Excellent',
      'color': Color(0xFF43A047), // Green
      'textColor': Colors.white,
      'icon': Icons.sentiment_very_satisfied
    },
    {
      'value': 'good',
      'label': 'Good',
      'color': Color(0xFF8BC34A), // Light Green
      'textColor': Colors.white,
      'icon': Icons.sentiment_satisfied
    },
    {
      'value': 'fair',
      'label': 'Fair',
      'color': Color(0xFFFFEB3B), // Yellow
      'textColor': Colors.black,
      'icon': Icons.sentiment_neutral
    },
    {
      'value': 'poor',
      'label': 'Poor',
      'color': Color(0xFFFF9800), // Orange
      'textColor': Colors.white,
      'icon': Icons.sentiment_dissatisfied
    },
    {
      'value': 'critical',
      'label': 'Critical',
      'color': Color(0xFFD32F2F), // Red
      'textColor': Colors.white,
      'icon': Icons.sentiment_very_dissatisfied
    },
  ];

  final List<String> speciesOptions = [
    'Red Mangrove',
    'Grey Mangrove',
    'Large-leaf Mangrove',
    'Spurred Mangrove',
    'Mangrove Apple',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    formData['timestamp'] = DateTime.now().toString();
  }

  void handleInputChange(String field, String value) {
    setState(() {
      formData[field] = value;
    });
  }

  void handleMediaCapture() {
    setState(() {
      capturedMedia.add('media_${DateTime.now().millisecondsSinceEpoch}.jpg');
    });
  }



  void handleSaveLocal() {
    // Simulate local save
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data saved locally!')));
  }

  void handleSubmitData() {
    if (selectedProject.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a project first')));
      return;
    }
    // Simulate data submission
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data submitted successfully!')));
  }



  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      title: 'Data Collection',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
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
                        onPressed: () => setState(() => isOnline = !isOnline),
                      ),
                    ],
                  ),
                ),
                CustomBadge(
                  label: formData['timestamp'] ?? '',
                  color: Colors.grey[300],
                  textStyle: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Project Selection
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Select Project', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  CustomSelect<String>(
                    items: projects
                        .map((p) => DropdownMenuItem<String>(
                              value: p['id'].toString(),
                              child: Text(p['name']),
                            ))
                        .toList(),
                    value: selectedProject.isEmpty ? null : selectedProject,
                    onChanged: (val) => setState(() => selectedProject = val ?? ''),
                    hint: 'Choose a project for data collection',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (selectedProject.isNotEmpty)
              Column(
                children: [
                  // Location & Time
                  CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.place, size: 18),
                            SizedBox(width: 6),
                            Flexible(
                              child: Text('Location & Time', style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('GPS Coordinates', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  Text(formData['gpsCoords'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 1),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Timestamp', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  Text(formData['timestamp'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 1),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        CustomButton(
                          label: 'Update Location',
                          outline: true,
                          width: double.infinity,
                          height: 36,
                          icon: const Icon(Icons.place, size: 16),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Media Capture
                  CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Media Capture', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                label: 'Photo',
                                outline: true,
                                height: 60,
                                icon: const Icon(Icons.camera_alt, size: 24),
                                onPressed: handleMediaCapture,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: CustomButton(
                                label: 'Video',
                                outline: true,
                                height: 60,
                                icon: const Icon(Icons.videocam, size: 24),
                                onPressed: handleMediaCapture,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Voice input removed
                        if (capturedMedia.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Captured Media (${capturedMedia.length})', style: const TextStyle(fontSize: 12)),
                              const SizedBox(height: 4),
                              SizedBox(
                                height: 60,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: capturedMedia.length,
                                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                                  itemBuilder: (context, index) => Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.image, size: 32, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Field Measurements
                  CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Field Measurements', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Sapling Count', style: TextStyle(fontSize: 12)),
                                  CustomInput(
                                    controller: TextEditingController(text: formData['saplingCount']),
                                    keyboardType: TextInputType.number,
                                    hintText: '0',
                                    onChanged: (val) => handleInputChange('saplingCount', val),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Water Salinity (ppt)', style: TextStyle(fontSize: 12)),
                                  CustomInput(
                                    controller: TextEditingController(text: formData['waterSalinity']),
                                    keyboardType: TextInputType.number,
                                    hintText: '0.0',
                                    onChanged: (val) => handleInputChange('waterSalinity', val),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Health Rating
                        const Text('Health Rating', style: TextStyle(fontSize: 12)),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: healthRatings.map((rating) {
                              final selected = formData['healthRating'] == rating['value'];
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 1),
                                child: CustomButton(
                                  label: '',
                                  height: 32,
                                  width: 60,
                                  color: selected ? rating['color'] : Colors.grey[100],
                                  icon: Icon(rating['icon'], color: selected ? rating['textColor'] : Colors.grey, size: 18),
                                  outline: !selected,
                                  onPressed: () => handleInputChange('healthRating', rating['value']),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Species Observed
                        const Text('Species Observed', style: TextStyle(fontSize: 12)),
                        CustomSelect<String>(
                          items: speciesOptions
                              .map((s) => DropdownMenuItem<String>(value: s, child: Text(s)))
                              .toList(),
                          value: formData['speciesObserved']!.isEmpty ? null : formData['speciesObserved'],
                          onChanged: (val) => handleInputChange('speciesObserved', val ?? ''),
                          hint: 'Select primary species',
                        ),
                        const SizedBox(height: 12),
                        // Sediment Depth
                        const Text('Sediment Depth (cm)', style: TextStyle(fontSize: 12)),
                        CustomInput(
                          controller: TextEditingController(text: formData['sedimentDepth']),
                          keyboardType: TextInputType.number,
                          hintText: '0',
                          onChanged: (val) => handleInputChange('sedimentDepth', val),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Notes & Observations
                  CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Notes & Observations', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        CustomTextarea(
                          controller: TextEditingController(text: formData['notes']),
                          hintText: 'Add any additional observations, unusual findings, or notes about the site conditions...',
                          minLines: 4,
                          maxLines: 6,
                          onChanged: (val) => handleInputChange('notes', val),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Data Validation Warning
                  if ((int.tryParse(formData['saplingCount'] ?? '') ?? 0) > 1000 ||
                      (double.tryParse(formData['waterSalinity'] ?? '') ?? 0) > 50)
                    CustomCard(
                      color: Colors.orange[50],
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.warning, color: Colors.orange, size: 28),
                          SizedBox(width: 8),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Unusual Reading Detected', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange), overflow: TextOverflow.ellipsis),
                                SizedBox(height: 2),
                                Text('Please verify your measurements. Some values appear unusually high.', style: TextStyle(fontSize: 12, color: Colors.orange), overflow: TextOverflow.ellipsis, maxLines: 2),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                  // Action Buttons
                  CustomButton(
                    label: 'Save to Local Storage',
                    outline: true,
                    width: double.infinity,
                    height: 44,
                    icon: const Icon(Icons.save, size: 18),
                    onPressed: handleSaveLocal,
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    label: isOnline ? 'Submit Data' : 'Submit (Offline)',
                    width: double.infinity,
                    height: 44,
                    icon: const Icon(Icons.upload, size: 18),
                    onPressed: isOnline ? handleSubmitData : null,
                  ),
                  if (!isOnline)
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        'Data will be submitted automatically when connection is restored',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 2,
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

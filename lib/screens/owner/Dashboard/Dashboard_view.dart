import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'add_phone_screen.dart'; // Import the new screen

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _addedPhones = [];

  void _navigateToAddPhoneScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddPhoneScreen()),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        _addedPhones.add(result);
      });
    }
  }

  Widget _buildHomeScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child:
                _addedPhones.isEmpty
                    ? const Center(child: Text("No phones added yet."))
                    : ListView.builder(
                      itemCount: _addedPhones.length,
                      itemBuilder: (context, index) {
                        final phone = _addedPhones[index];
                        final List<File> images = phone["images"];
                        bool isExpanded = phone["isExpanded"] ?? false;

                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Top Row with Info + Delete Icon
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    images.isNotEmpty
                                        ? GestureDetector(
                                          onTap: () {
                                            _openImageViewer(
                                              context,
                                              images[0],
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: Image.file(
                                              images[0],
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                        : const Icon(Icons.image, size: 60),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            phone["name"] ?? '',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text("Brand: ${phone["brand"]}"),
                                          Text("Price: ₹${phone["price"]}"),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _addedPhones.removeAt(index);
                                        });
                                      },
                                    ),
                                  ],
                                ),

                                // View More Section
                                if (isExpanded) ...[
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 80,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images.length,
                                      separatorBuilder:
                                          (_, __) => const SizedBox(width: 8),
                                      itemBuilder: (context, i) {
                                        return GestureDetector(
                                          onTap:
                                              () => _openImageViewer(
                                                context,
                                                images[i],
                                              ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: Image.file(
                                              images[i],
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text("RAM: ${phone["ram"]}"),
                                  Text("Storage: ${phone["storage"]}"),
                                  Text("Condition: ${phone["condition"]}"),
                                  Text("Description: ${phone["description"]}"),
                                ],

                                // Toggle Button
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    child: Text(
                                      isExpanded ? "View Less" : "View More",
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        phone["isExpanded"] = !isExpanded;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsScreen() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        ListTile(leading: Icon(Icons.person), title: Text('Account Settings')),
        Divider(),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notifications'),
        ),
        Divider(),
        ListTile(leading: Icon(Icons.lock), title: Text('Privacy')),
        Divider(),
        ListTile(leading: Icon(Icons.info), title: Text('About')),
      ],
    );
  }

  void _openImageViewer(BuildContext context, File imageFile) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            backgroundColor: Colors.transparent,
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.5,
              maxScale: 4.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(imageFile),
              ),
            ),
          ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [_buildHomeScreen(), _buildSettingsScreen()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('mobisell'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: screens[_selectedIndex],
      floatingActionButton:
          _selectedIndex == 0
              ? FloatingActionButton(
                onPressed: _navigateToAddPhoneScreen,
                backgroundColor: Colors.white,
                child: Icon(Icons.mobile_screen_share),
              )
              : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

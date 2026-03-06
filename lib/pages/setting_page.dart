import 'package:flutter/material.dart';
import 'package:maintenance_provider_service/pages/service_page.dart';
import 'package:maintenance_provider_service/pages/notification_page.dart';
import 'package:maintenance_provider_service/pages/home_page.dart'; // Keep this import

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Setting',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Settings content
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 16),

                // Settings Header
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Edit Profile
                _buildSettingItem(
                  icon: Icons.person_outline,
                  title: 'Edit profile',
                  onTap: () {
                    // Navigate to edit profile page
                  },
                ),

                // Change Password
                _buildSettingItem(
                  icon: Icons.lock_outline,
                  title: 'Change password',
                  onTap: () {
                    // Navigate to change password page
                  },
                ),

                // Privacy and Policy
                _buildSettingItem(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy and Policy',
                  onTap: () {
                    // Navigate to privacy policy page
                  },
                ),

                // Language
                _buildSettingItem(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  onTap: () {
                    _showLanguageDialog(context);
                  },
                ),

                // Dark Mode Toggle
                _buildSwitchSettingItem(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark',
                  value: false,
                  onChanged: (value) {
                    print('Dark mode: $value');
                  },
                ),
              ],
            ),
          ),

          // Bottom Navigation Bar
          _buildBottomNavBar(context),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF1E6F86), size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchSettingItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF1E6F86), size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF1E6F86),
        activeTrackColor: const Color(0xFF1E6F86).withOpacity(0.5),
      ),
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 3,
      selectedItemColor: const Color(0xFF1E6F86),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()), // Uses imported HomePage
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ServicePage()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const NotificationPage()),
            );
            break;
          case 3:
            // Already on Setting page
            break;
        }
      },
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_num_outlined),
          label: "Service",
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.notifications_none),
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          label: "Notifications",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ],
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                leading: const Icon(Icons.check, color: Color(0xFF1E6F86)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Khmer'),
                leading: const Icon(Icons.check, color: Colors.transparent),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Chinese'),
                leading: const Icon(Icons.check, color: Colors.transparent),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF1E6F86),
              ),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

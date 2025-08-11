import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context), // The navigation drawer
      appBar: AppBar(
          // The AppBar is transparent, so the gradient shows through
          ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // The gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A192F), Color(0xFF172A46), Color(0xFF304878)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Name Title
                const Text(
                  'Student Connect',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your personal student dashboard.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 60),

                // Grid of shortcut icons
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    _buildShortcutCard(
                      context: context,
                      icon: Icons.wb_sunny,
                      label: 'Weather',
                      routeName: '/weather',
                    ),
                    _buildShortcutCard(
                      context: context,
                      icon: Icons.task_alt,
                      label: 'Tasks',
                      routeName: '/tasks',
                    ),
                    _buildShortcutCard(
                      context: context,
                      icon: Icons.contact_mail,
                      label: 'Contact Admin',
                      routeName: '/profile',
                    ),
                    _buildShortcutCard(
                      context: context,
                      icon: Icons.info_outline,
                      label: 'About',
                      routeName: '/about',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for the styled shortcut cards
  Widget _buildShortcutCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String routeName,
  }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white24, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 44, color: Colors.lightBlueAccent),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // The drawer from our original space theme
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0A192F), // Match the dark theme
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF304878), Color(0xFF172A46)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.hub_outlined, color: Colors.white, size: 40),
                SizedBox(width: 16),
                Text('Navigation',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ],
            ),
          ),
          ListTile(
              leading:
                  const Icon(Icons.wb_cloudy, color: Colors.lightBlueAccent),
              title: const Text('Weather'),
              onTap: () => Navigator.pushNamed(context, '/weather')),
          ListTile(
              leading:
                  const Icon(Icons.task_alt, color: Colors.lightBlueAccent),
              title: const Text('Tasks'),
              onTap: () => Navigator.pushNamed(context, '/tasks')),
          ListTile(
              leading: const Icon(Icons.person_search,
                  color: Colors.lightBlueAccent),
              title: const Text('Contact Admin'),
              onTap: () => Navigator.pushNamed(context, '/profile')),
          ListTile(
              leading: const Icon(Icons.info, color: Colors.lightBlueAccent),
              title: const Text('About'),
              onTap: () => Navigator.pushNamed(context, '/about')),
        ],
      ),
    );
  }
}

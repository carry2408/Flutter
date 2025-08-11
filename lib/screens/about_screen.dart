import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A192F), Color(0xFF172A46), Color(0xFF304878)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // Use a ListView for scrollable content
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
          children: [
            // Main App Title and Description
            const Text(
              'Student Connect',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'A simple Flutter demo app for students, featuring API integration, local storage, and a custom space theme.',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 32),

            // Key Features Section
            const Text(
              'Key Features',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent),
            ),
            const Divider(
                color: Colors.lightBlueAccent, thickness: 0.5, endIndent: 150),
            const SizedBox(height: 16),

            // Feature 1: Weather
            _buildFeatureTile(
              icon: Icons.wb_cloudy_outlined,
              title: 'Live Weather',
              subtitle:
                  'Current temperature for Bengaluru via the Open-Meteo public API.',
            ),

            // Feature 2: Tasks
            _buildFeatureTile(
              icon: Icons.task_alt,
              title: 'Persistent Tasks (CRUD)',
              subtitle:
                  'Add, edit, and delete tasks, stored locally on your device with SharedPreferences.',
            ),

            // Feature 3: Contact
            _buildFeatureTile(
              icon: Icons.contact_mail_outlined,
              title: 'Contact Admin (Form)',
              subtitle:
                  'Fill out a form to send an email directly from inside the app.',
            ),

            // Feature 4: Design
            _buildFeatureTile(
              icon: Icons.palette_outlined,
              title: 'Custom Design & Navigation',
              subtitle:
                  'A custom space theme with gradients, a navigation drawer, and named routes.',
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to create consistent feature tiles
  Widget _buildFeatureTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: Icon(icon, size: 40, color: Colors.lightBlueAccent),
      title: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle,
          style: const TextStyle(color: Colors.white70, height: 1.4)),
    );
  }
}

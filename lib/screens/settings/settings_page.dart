// lib/screens/settings/settings_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/theme_provider.dart';
import 'package:flutter_application_2/screens/settings/about_us_page.dart';
import 'package:flutter_application_2/screens/settings/contact_us_page.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the provider to get the current theme state
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                // Use the provider to toggle the theme
                final provider = Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(value);
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About Us'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutUsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail_outlined),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactUsPage()));
            },
          ),
        ],
      ),
    );
  }
}
// lib/widgets/app_drawer.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/auth/login_screen.dart';
import 'package:flutter_application_2/screens/features/bike_page.dart';
import 'package:flutter_application_2/screens/features/book_page.dart';
import 'package:flutter_application_2/screens/features/house_service_page.dart';
import 'package:flutter_application_2/screens/features/skill_exchange_page.dart';
import 'package:flutter_application_2/screens/settings/settings_page.dart'; // Import the new settings page

class AppDrawer extends StatelessWidget {
  final String username;

  const AppDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text("Welcome to LifeGenie!"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.indigo,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('Book Zone'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (_) => const BookPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.motorcycle),
            title: const Text('Bike Zone'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const BikePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.cleaning_services),
            title: const Text('House Services'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const HouseServicePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.handshake),
            title: const Text('Skill Exchange'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SkillExchangePage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to the new settings page
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                (route) => false, // This removes all previous routes
              );
            },
          ),
        ],
      ),
    );
  }
}
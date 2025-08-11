// lib/screens/home/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/features/bike_page.dart';
import 'package:flutter_application_2/screens/features/book_page.dart';
import 'package:flutter_application_2/screens/features/house_service_page.dart';
import 'package:flutter_application_2/screens/features/skill_exchange_page.dart';
import 'package:flutter_application_2/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning,';
    } else if (hour < 17) {
      return 'Good afternoon,';
    } else {
      return 'Good evening,';
    }
  }

  final List<Map<String, dynamic>> _allServices = [
    {'title': 'Book Zone', 'icon': Icons.menu_book, 'page': const BookPage()},
    {'title': 'Bike Zone', 'icon': Icons.motorcycle, 'page': const BikePage()},
    {'title': 'House Services', 'icon': Icons.cleaning_services, 'page': const HouseServicePage()},
    {'title': 'Skill Exchange', 'icon': Icons.handshake, 'page': const SkillExchangePage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeGenie'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: AppDrawer(username: widget.username),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getGreeting(),
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              Text(
                widget.username,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Discover Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _allServices.length,
                  itemBuilder: (context, index) {
                    final service = _allServices[index];
                    return ModernFeatureCard(
                      title: service['title'],
                      icon: service['icon'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => service['page']),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),

              // --- NEW: COMMUNITY HIGHLIGHT CARD ---
              const Text(
                'Community Highlight',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              const HighlightCard(
                title: 'Blood Donation Camp',
                description: 'Join us this weekend at City Hospital and save lives.',
                buttonText: 'Learn More',
              ),
              const SizedBox(height: 30),

              // --- NEW: MORE TO EXPLORE SECTION ---
              const Text(
                'More to Explore',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              // This ListView is nested inside a Column/SingleChildScrollView,
              // so we must use `shrinkWrap` and disable its scrolling.
              ListView.builder(
                itemCount: 2, // Let's just show the first 2 services here
                shrinkWrap: true, // Important for nested lists
                physics: const NeverScrollableScrollPhysics(), // Important for nested lists
                itemBuilder: (context, index) {
                  final service = _allServices[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: Icon(service['icon'], color: Theme.of(context).colorScheme.primary),
                      title: Text(service['title']),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => service['page']),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 20), // Extra space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

// --- Modern card for the carousel (no changes needed) ---
class ModernFeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ModernFeatureCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: isDark 
              ? [const Color(0xFF2A2D34), const Color(0xFF2E3239)]
              : [Colors.white, Colors.grey.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 36, color: Theme.of(context).colorScheme.primary),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// --- NEW WIDGET: The large highlight card ---
class HighlightCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;

  const HighlightCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.indigo.shade400, Colors.purple.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: Text(buttonText),
          )
        ],
      ),
    );
  }
}
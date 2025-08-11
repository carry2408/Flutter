// lib/screens/features/barter_request_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/features/skill_exchange_page.dart'; // Import Skill class

class BarterRequestPage extends StatelessWidget {
  final Skill skill;
  const BarterRequestPage({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Barter')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Send barter request for:', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.handshake, size: 40),
                title: Text(skill.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Text('In exchange for: ${skill.description}'),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Barter request for ${skill.title} sent!'),
                    backgroundColor: Colors.green,
                  ),
                );
                 Future.delayed(const Duration(seconds: 2), () => Navigator.pop(context));
              },
              child: const Text('Send Request'),
            ),
             const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
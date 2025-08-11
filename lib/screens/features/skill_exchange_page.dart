// lib/screens/features/skill_exchange_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/features/barter_request_page.dart'; // New file to create

class Skill {
  final String title;
  final String description;

  const Skill({required this.title, required this.description});
}

class SkillExchangePage extends StatelessWidget {
  const SkillExchangePage({super.key});

  final List<Skill> skills = const [
    Skill(title: 'Guitar Lessons', description: 'Seeking help with painting'),
    Skill(title: 'Math Tutoring', description: 'In exchange for coding lessons'),
    Skill(title: 'Cooking Classes', description: 'Will trade for language practice'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skill Exchange')),
      body: ListView.builder(
        itemCount: skills.length,
        itemBuilder: (context, index) {
          final skill = skills[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: ListTile(
              title: Text(skill.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(skill.description),
              trailing: ElevatedButton(
                child: const Text('Barter'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BarterRequestPage(skill: skill)),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
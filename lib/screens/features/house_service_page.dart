// lib/screens/features/house_service_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/features/service_request_page.dart'; // New file to create

class HouseService {
  final String name;
  final String description;

  const HouseService({required this.name, required this.description});
}

class HouseServicePage extends StatelessWidget {
  const HouseServicePage({super.key});

  final List<HouseService> services = const [
    HouseService(name: 'Professional Cleaner', description: 'Complete home deep cleaning'),
    HouseService(name: 'Certified Electrician', description: 'All electrical repairs & installations'),
    HouseService(name: 'Expert Plumber', description: 'Leak fixes, pipe installations & more'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('House Services')),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: ListTile(
              title: Text(service.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(service.description),
              trailing: ElevatedButton(
                child: const Text('Request'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServiceRequestPage(service: service)),
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
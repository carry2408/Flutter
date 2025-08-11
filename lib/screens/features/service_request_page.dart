// lib/screens/features/service_request_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/features/house_service_page.dart'; // Import HouseService class

class ServiceRequestPage extends StatelessWidget {
  final HouseService service;
  const ServiceRequestPage({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Request')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Confirm your service request for:', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.engineering, size: 40),
                title: Text(service.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Text(service.description),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Request for ${service.name} has been sent!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Future.delayed(const Duration(seconds: 2), () => Navigator.pop(context));
              },
              child: const Text('Confirm Request'),
            ),
             const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
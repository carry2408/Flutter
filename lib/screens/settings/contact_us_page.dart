
// lib/screens/settings/contact_us_page.dart

import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextField(decoration: InputDecoration(labelText: 'Your Name')),
              const SizedBox(height: 16),
              const TextField(decoration: InputDecoration(labelText: 'Your Email')),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Your Message'),
                maxLines: 5,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Thank you! Your message has been sent.')),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// lib/screens/features/bike_booking_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/features/bike_page.dart'; // Import Bike class

class BikeBookingPage extends StatelessWidget {
  final Bike bike;
  const BikeBookingPage({super.key, required this.bike});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Booking')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('You have selected:', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                title: Text(bike.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Text(bike.details),
                trailing: Text(
                  '₹${bike.pricePerDay.toStringAsFixed(2)}/day',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${bike.name} booked successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Future.delayed(const Duration(seconds: 2), () => Navigator.pop(context));
              },
              child: const Text('Confirm Booking'),
            ),
             const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
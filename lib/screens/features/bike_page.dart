// lib/screens/features/bike_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/features/bike_booking_page.dart'; // New file to create

class Bike {
  final String name;
  final String details;
  final double pricePerDay;

  const Bike({required this.name, required this.details, required this.pricePerDay});
}

class BikePage extends StatelessWidget {
  const BikePage({super.key});

  final List<Bike> bikes = const [
    Bike(name: 'Activa 6G', details: 'Clean, 4⭐ rating, 1 Helmet', pricePerDay: 250.00),
    Bike(name: 'Bajaj Pulsar 150', details: 'Good for city rides, 2 Helmets', pricePerDay: 400.00),
    Bike(name: 'Royal Enfield Classic', details: 'Perfect for long tours', pricePerDay: 800.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bike Rentals')),
      body: ListView.builder(
        itemCount: bikes.length,
        itemBuilder: (context, index) {
          final bike = bikes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: ListTile(
              title: Text(bike.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(bike.details),
              trailing: ElevatedButton(
                child: const Text('Book Now'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BikeBookingPage(bike: bike)),
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
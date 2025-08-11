// lib/screens/features/payment_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/features/book_page.dart'; // Import the Book class

class PaymentPage extends StatelessWidget {
  final Book book;

  // The constructor requires a 'book' object to be passed to it
  const PaymentPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Purchase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                title: Text(book.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: const Text('eBook, Digital Copy'),
                trailing: Text(
                  '₹${book.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(), // Pushes the button to the bottom
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60), // Make button taller
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                // Mock payment action
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Payment for "${book.title}" successful!'),
                    backgroundColor: Colors.green,
                  ),
                );
                // Go back to the book store after showing the message
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                });
              },
              child: Text('Pay ₹${book.price.toStringAsFixed(2)}'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
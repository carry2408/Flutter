// lib/screens/features/book_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/features/payment_page.dart';

class Book {
  final String title;
  final double price;
  const Book({required this.title, required this.price});
}

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  final List<Book> books = const [
    Book(title: 'The Alchemist', price: 249.00),
    Book(title: 'Atomic Habits', price: 399.50),
    Book(title: 'Ikigai: The Japanese Secret', price: 320.00),
    Book(title: 'Rich Dad Poor Dad', price: 299.00),
    Book(title: 'Sapiens: A Brief History', price: 450.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeGenie Book Store'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          // Using the standard Card and ListTile which should now work with the default theme.
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              title: Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('₹${book.price.toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                child: const Text('Purchase'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(book: book),
                    ),
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
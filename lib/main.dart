import 'package:flutter/material.dart';
import 'package:student_connect/screens/about_screen.dart';
import 'package:student_connect/screens/home_screen.dart';
import 'package:student_connect/screens/profile_screen.dart';
import 'package:student_connect/screens/tasks_screen.dart';
import 'package:student_connect/screens/weather_screen.dart';

void main() {
  runApp(const StudentConnectApp());
}

class StudentConnectApp extends StatelessWidget {
  const StudentConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Connect',
      debugShowCheckedModeBanner: false,
      // Reverting to our dark space theme
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue[300],
        scaffoldBackgroundColor: const Color(0xFF0A192F), // A deep blue
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, // Transparent AppBar
          elevation: 0,
        ),
        cardColor: const Color(0xFF172A46), // A slightly lighter navy for cards
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/weather': (context) => const WeatherScreen(),
        '/tasks': (context) => const TasksScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}

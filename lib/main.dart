// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/theme_provider.dart';
import 'package:flutter_application_2/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  // Wrap the app in our ThemeProvider
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const LifeGenieApp(),
    ),
  );
}

class LifeGenieApp extends StatelessWidget {
  const LifeGenieApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer listens to changes in ThemeProvider and rebuilds the MaterialApp
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'LifeGenie',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode, // Controlled by the provider
          
          // Define your light theme
          theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.indigo,
              brightness: Brightness.light,
            ),
             appBarTheme: const AppBarTheme(
               backgroundColor: Colors.indigo,
               foregroundColor: Colors.white,
            ),
          ),
          
          // Define your dark theme
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.indigo,
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: const Color(0xFF1E2126),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF2A2D34),
            ),
          ),
          
          home: LoginScreen(),
        );
      },
    );
  }
}